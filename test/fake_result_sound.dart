import 'package:karasu/services/result_sound.dart';

/// Fake result sound: records whether each played sound was for a correct
/// answer, without playing anything.
class FakeResultSound implements ResultSound {
  final List<bool> played = [];

  @override
  Future<void> play(bool isCorrect) async {
    played.add(isCorrect);
  }

  @override
  Future<void> dispose() async {}
}
