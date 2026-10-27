import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Asset bundle for tests: serves the config file at [configPath] as
/// `assets/config.json`.
class TestConfigBundle extends CachingAssetBundle {
  final String configPath;

  TestConfigBundle(this.configPath);

  @override
  Future<ByteData> load(String key) async {
    if (key == 'assets/config.json') {
      return ByteData.sublistView(File(configPath).readAsBytesSync());
    }
    throw FlutterError('Unable to load asset: $key');
  }
}
