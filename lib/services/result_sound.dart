import 'package:audioplayers/audioplayers.dart';
import 'package:karasu/services/settings_service.dart';

/// Plays the correct or wrong answer sound, unless sound is turned off.
class ResultSound {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(bool isCorrect) async {
    if (!SettingsService.soundEnabled) return;

    final asset = isCorrect ? 'correct.mp3' : 'incorrect.mp3';
    await _audioPlayer.play(AssetSource(asset));
  }

  Future<void> dispose() => _audioPlayer.dispose();
}
