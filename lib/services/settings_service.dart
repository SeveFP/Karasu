import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsService {
  static const _soundEnabledKey = 'sound_enabled';
  static final _storage = const FlutterSecureStorage();
  static bool _soundEnabled = true;

  static bool get soundEnabled => _soundEnabled;

  static Future<void> load() async {
    final value = await _storage.read(key: _soundEnabledKey);
    _soundEnabled = value == null ? true : value == 'true';
  }

  static Future<void> setSoundEnabled(bool value) async {
    _soundEnabled = value;
    await _storage.write(key: _soundEnabledKey, value: value.toString());
  }
}
