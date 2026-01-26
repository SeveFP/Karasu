import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:karasu/services/audio_service.dart';
import 'package:karasu/services/logger_service.dart';

/// Audio player widget using shared AudioService.
/// Multiple widgets can exist, but only one audio plays at a time.
class AudioPlayerWidget extends StatefulWidget {
  final String url;
  const AudioPlayerWidget({super.key, required this.url});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  // Unique identifier for this widget instance
  final Object _instanceId = Object();

  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _pos = Duration.zero;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void initState() {
    super.initState();
    _posSub = AudioService.instance.positionStream.listen((p) {
      if (!mounted) return;
      // Only update if this widget instance is currently playing
      if (AudioService.instance.isCurrentOwner(_instanceId)) {
        setState(() => _pos = p);
      }
    });
    _stateSub = AudioService.instance.stateStream.listen((s) {
      if (!mounted) return;
      final isMe = AudioService.instance.isCurrentOwner(_instanceId);
      setState(() {
        if (!isMe) {
          // Another audio took over
          _isPlaying = false;
          _pos = Duration.zero;
          return;
        }
        switch (s) {
          case PlayerState.playing:
            _isPlaying = true;
            _isLoading = false;
            break;
          case PlayerState.completed:
            _isPlaying = false;
            _pos = Duration.zero;
            break;
          case PlayerState.paused:
          case PlayerState.stopped:
          case PlayerState.disposed:
            _isPlaying = false;
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _posSub?.cancel();
    _stateSub?.cancel();

    AudioService.instance.stop();

    super.dispose();
  }

  Future<void> _toggle() async {
    if (_isPlaying) {
      await AudioService.instance.pause();
      return;
    }

    // Only show spinner if we need to download (not cached)
    final needsDownload = !AudioService.instance.isUrlCached(widget.url);
    if (needsDownload) {
      setState(() => _isLoading = true);
    }
    try {
      await AudioService.instance.play(widget.url, ownerId: _instanceId);
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        // Log error but don't show snackbar - some errors are browser-specific
        // and not actionable by the user
        LoggerService.instance.w('Audio error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // For a better UX, given that loading is short, the pause icon is shown
        // even while loading.
        IconButton(
          icon: Icon(_isLoading || _isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _toggle,
        ),
        Text(_format(_pos)),
      ],
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final m = two(d.inMinutes % 60);
    final s = two(d.inSeconds % 60);
    return '$m:$s';
  }
}
