import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:karasu/services/signed_url_service.dart';

/// Singleton audio service that manages a shared AudioPlayer instance.
/// Pre-initializes the native audio player to avoid UI freezes.
class AudioService {
  AudioService._();
  static final AudioService instance = AudioService._();

  AudioPlayer? _player;
  bool _isInitialized = false;
  bool _isInitializing = false;

  // Current playback state - track by instance ID, not URL
  // (same URL can appear multiple times on a page)
  Object? _currentOwnerId;
  String? _currentUrl;

  // Track last loaded URL to enable replay without re-downloading
  String? _lastLoadedUrl;
  String? _lastResolvedUrl; // Cache resolved URL to avoid re-signing

  final _positionController = StreamController<Duration>.broadcast();
  final _stateController = StreamController<PlayerState>.broadcast();

  Stream<Duration> get positionStream => _positionController.stream;
  Stream<PlayerState> get stateStream => _stateController.stream;

  /// Check if the given URL is already loaded and cached (replay won't need download).
  bool isUrlCached(String url) => url == _lastLoadedUrl && _lastResolvedUrl != null;

  /// Pre-initialize the audio player in the background.
  /// Call this early (e.g., at app startup or when entering a lesson).
  Future<void> initialize() async {
    if (_isInitialized || _isInitializing) return;
    _isInitializing = true;

    _player = AudioPlayer();
    _player!.onPositionChanged.listen((pos) {
      _positionController.add(pos);
    });
    _player!.onPlayerStateChanged.listen((state) {
      _stateController.add(state);
      // Reset owner tracking when audio completes so replay works
      if (state == PlayerState.completed) {
        _currentOwnerId = null;
        _currentUrl = null;
      }
    });

    _isInitialized = true;
    _isInitializing = false;
  }

  /// Play audio from the given URL.
  /// [ownerId] identifies the widget instance requesting playback.
  /// Resolves signed URL if needed and starts playback.
  /// If another audio is playing, it will be stopped first.
  Future<void> play(String url, {required Object ownerId}) async {
    // Ensure player is initialized
    if (!_isInitialized) {
      await initialize();
    }

    // If same owner and same URL (paused), just resume
    if (_currentOwnerId == ownerId && _currentUrl == url) {
      await _player!.resume();
      return;
    }

    // If replaying the same URL that's already loaded (completed or different owner),
    // reuse the buffer by seeking to start instead of re-downloading
    if (url == _lastLoadedUrl && _lastResolvedUrl != null) {
      // Stop current if different owner
      if (_currentOwnerId != null && _currentOwnerId != ownerId) {
        await _player!.stop();
      }
      _currentOwnerId = ownerId;
      _currentUrl = url;
      // Just call play() - it starts from beginning and works on completed audio
      await _player!.play(UrlSource(_lastResolvedUrl!));
      return;
    }

    // Different URL - stop current and load new
    if (_currentOwnerId != null) {
      await _player!.stop();
    }

    // Resolve signed URL
    final resolvedUrl = await SignedUrlService.instance.resolve(url);
    _currentOwnerId = ownerId;
    _currentUrl = url;
    _lastLoadedUrl = url;
    _lastResolvedUrl = resolvedUrl;

    await _player!.play(UrlSource(resolvedUrl));
  }

  /// Pause current playback.
  Future<void> pause() async {
    await _player?.pause();
  }

  /// Stop current playback and reset.
  Future<void> stop() async {
    await _player?.stop();
    _currentOwnerId = null;
    _currentUrl = null;
  }

  /// Check if the given owner is currently active (playing or paused).
  bool isCurrentOwner(Object ownerId) => _currentOwnerId == ownerId;

  /// Dispose the service (call on app shutdown if needed).
  void dispose() {
    _player?.dispose();
    _positionController.close();
    _stateController.close();
  }
}
