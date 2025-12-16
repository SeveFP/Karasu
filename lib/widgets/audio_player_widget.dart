import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:karasu/services/logger_service.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;

  const AudioPlayerWidget({required this.url, super.key});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final _logger = LoggerService.instance;

  AudioSource? _source;
  SoundHandle? _handle;

  bool _isInitialized = false;
  bool _isLoading = true;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  Timer? _positionTimer;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      try {
        if (!SoLoud.instance.isInitialized) {
          await SoLoud.instance.init();
        }
      } catch (e, stack) {
        _logger.e('initializing SoLoud: $e', error: e, stackTrace: stack);
        rethrow;
      }

      await _loadAudio();

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isLoading = false;
        });
      }
    } catch (e, stack) {
      _logger.e('initializing audio player: $e',
          error: e, stackTrace: stack);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _loadAudio() async {
    try {
      _source = await SoLoud.instance.loadUrl(widget.url);
      _duration = SoLoud.instance.getLength(_source!);
    } catch (e, stack) {
      _logger.e('loading audio: $e', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> _play() async {
    if (_source == null) return;

    try {
      _handle = await SoLoud.instance.play(_source!);
      _startPositionUpdates();

      if (mounted) {
        setState(() => _isPlaying = true);
      }

      // Listen for when the sound finishes
      _checkPlaybackStatus();
    } catch (e, stack) {
      _logger.e('playing audio', error: e, stackTrace: stack);
    }
  }

  void _startPositionUpdates() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (_handle != null && mounted) {
        try {
          final pos = SoLoud.instance.getPosition(_handle!);
          setState(() => _position = pos);
        } catch (e) {
          // Handle might be invalid
          _stopPositionUpdates();
        }
      }
    });
  }

  void _stopPositionUpdates() {
    _positionTimer?.cancel();
    _positionTimer = null;
  }

  void _checkPlaybackStatus() async {
    // Poll to check if sound has finished
    while (_handle != null && _isPlaying && mounted) {
      await Future.delayed(const Duration(milliseconds: 200));

      if (_handle == null) break;

      final isValid = SoLoud.instance.getIsValidVoiceHandle(_handle!);
      if (!isValid && mounted) {
        setState(() {
          _isPlaying = false;
          _position = Duration.zero;
        });
        _stopPositionUpdates();
        _handle = null;
        break;
      }
    }
  }

  Future<void> _pause() async {
    if (_handle == null) return;

    try {
      SoLoud.instance.setPause(_handle!, true);
      _stopPositionUpdates();

      if (mounted) {
        setState(() => _isPlaying = false);
      }
    } catch (e, stack) {
      _logger.e('pausing audio', error: e, stackTrace: stack);
    }
  }

  Future<void> _resume() async {
    if (_handle == null) return;

    try {
      // Check if handle is still valid
      if (!SoLoud.instance.getIsValidVoiceHandle(_handle!)) {
        // Handle expired, need to play again
        await _play();
        return;
      }

      SoLoud.instance.setPause(_handle!, false);
      _startPositionUpdates();

      if (mounted) {
        setState(() => _isPlaying = true);
      }

      _checkPlaybackStatus();
    } catch (e, stack) {
      _logger.e('resuming audio', error: e, stackTrace: stack);
    }
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _pause();
    } else if (_handle != null &&
        SoLoud.instance.getIsValidVoiceHandle(_handle!)) {
      await _resume();
    } else {
      await _play();
    }
  }

  Future<void> _seek(double value) async {
    if (_handle == null || _source == null) return;

    try {
      final seekPosition = Duration(milliseconds: value.toInt());
      SoLoud.instance.seek(_handle!, seekPosition);

      if (mounted) {
        setState(() => _position = seekPosition);
      }
    } catch (e, stack) {
      _logger.e('seeking', error: e, stackTrace: stack);
    }
  }

  Future<void> _stop() async {
    if (_handle == null) return;

    try {
      SoLoud.instance.stop(_handle!);
      _stopPositionUpdates();

      if (mounted) {
        setState(() {
          _isPlaying = false;
          _position = Duration.zero;
        });
      }
      _handle = null;
    } catch (e, stack) {
      _logger.e('stopping audio', error: e, stackTrace: stack);
    }
  }

  Future<void> _retryLoad() async {
    if (_isLoading) return;
    _stopPositionUpdates();
    setState(() {
      _isLoading = true;
      _isInitialized = false;
      _source = null;
      _handle = null;
      _duration = Duration.zero;
      _position = Duration.zero;
    });
    await _initialize();
  }

  @override
  void dispose() {
    _stopPositionUpdates();

    // Stop playback
    if (_handle != null) {
      try {
        SoLoud.instance.stop(_handle!);
      } catch (_) {}
    }

    // Dispose the audio source
    if (_source != null) {
      try {
        SoLoud.instance.disposeSource(_source!);
      } catch (_) {}
    }

    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (!_isInitialized || _source == null) {
      return SizedBox(
        height: 60,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Failed to load audio'),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.refresh),
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: _retryLoad,
              ),
            ],
          ),
        ),
      );
    }

    final maxDuration = _duration.inMilliseconds.toDouble();
    final currentPosition =
        _position.inMilliseconds.toDouble().clamp(0, maxDuration);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                _isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
              ),
              iconSize: 36,
              onPressed: _togglePlayPause,
            ),
            IconButton(
              icon: const Icon(Icons.stop_circle_outlined),
              iconSize: 28,
              onPressed: _isPlaying || _position > Duration.zero ? _stop : null,
            ),
            const SizedBox(width: 8),
            Text(
              '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Slider(
          value: currentPosition.toDouble(),
          max: maxDuration > 0 ? maxDuration : 1,
          onChanged: maxDuration > 0 ? _seek : null,
        ),
      ],
    );
  }
}
