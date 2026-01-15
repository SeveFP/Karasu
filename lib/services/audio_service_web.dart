import 'dart:async';
import 'dart:js_interop';

import 'package:audioplayers/audioplayers.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:web/web.dart' as web;

/// Web-specific audio service using HTML5 Audio element.
/// This is more reliable on iOS Safari than audioplayers' Web Audio API.
///
/// IMPORTANT:
/// This streams audio directly instead of returning a signed URL JSON.
class AudioService {
  AudioService._();
  static final AudioService instance = AudioService._();

  final _log = LoggerService.instance;

  // Create audio element immediately - iOS Safari requires this before user gesture
  late final web.HTMLAudioElement _audio;
  bool _initialized = false;

  Object? _currentOwnerId;
  String? _currentUrl;
  String? _lastLoadedUrl;
  String? _lastResolvedUrl;

  final _positionController = StreamController<Duration>.broadcast();
  final _stateController = StreamController<PlayerState>.broadcast();

  Stream<Duration> get positionStream => _positionController.stream;
  Stream<PlayerState> get stateStream => _stateController.stream;

  bool isUrlCached(String url) =>
      url == _lastLoadedUrl && _lastResolvedUrl != null;

  Future<void> initialize() async {
    _ensureInitialized();
  }

  void _ensureInitialized() {
    if (_initialized) return;
    _initialized = true;

    _audio = web.HTMLAudioElement();
    // iOS Safari may require audio element to be in the DOM
    _audio.style.display = 'none';
    web.document.body?.append(_audio);

    _audio.ontimeupdate = (web.Event e) {
      final pos = Duration(milliseconds: (_audio.currentTime * 1000).toInt());
      _positionController.add(pos);
    }.toJS;

    _audio.onplay = (web.Event e) {
      _log.d('State changed: playing');
      _stateController.add(PlayerState.playing);
    }.toJS;

    _audio.onpause = (web.Event e) {
      _log.d('State changed: paused');
      _stateController.add(PlayerState.paused);
    }.toJS;

    _audio.onended = (web.Event e) {
      _log.d('State changed: completed');
      _stateController.add(PlayerState.completed);
      _currentOwnerId = null;
      _currentUrl = null;
    }.toJS;

    _audio.onerror = (web.Event e) {
      _log.e('Audio error: ${_audio.error?.message}');
      _log.e('Audio error code: ${_audio.error?.code}');
    }.toJS;
  }

  Future<void> play(String url, {required Object ownerId}) async {
    _log.d('play() called - url: $url');
    _ensureInitialized();

    // If same owner and same URL (paused), just resume
    if (_currentOwnerId == ownerId && _currentUrl == url) {
      _log.d('-> Resuming (same owner, same URL)');
      // Don't await - iOS Safari needs synchronous play in gesture handler
      _audio.play();
      return;
    }

    // If replaying the same URL that's already loaded
    if (url == _lastLoadedUrl) {
      _log.d('-> Replay cached URL');
      _audio.currentTime = 0;
      _currentOwnerId = ownerId;
      _currentUrl = url;
      _audio.play();
      return;
    }

    // Different URL - stop current and load new
    _log.d('-> New URL, loading fresh');
    _audio.pause();

    _currentOwnerId = ownerId;
    _currentUrl = url;
    _lastLoadedUrl = url;
    _lastResolvedUrl = url;

    _log.d('Setting src and playing: $url');
    _audio.src = url;
    _audio.play();
    _log.d('play() called (not awaited)');
  }

  Future<void> pause() async {
    _audio.pause();
  }

  Future<void> stop() async {
    _audio.pause();
    _audio.currentTime = 0;
    _currentOwnerId = null;
    _currentUrl = null;
  }

  bool isCurrentOwner(Object ownerId) => _currentOwnerId == ownerId;

  void dispose() {
    _audio.pause();
    _audio.remove();
    _positionController.close();
    _stateController.close();
  }
}
