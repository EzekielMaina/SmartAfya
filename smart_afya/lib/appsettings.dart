import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Afyasettings {
  static SharedPreferences? _preferences;

  static const _keyBrightness = 'brightness';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setBrightness(Brightness brightness) async {
    if (_preferences == null) {
      await init();
    }
    _preferences!.setInt(_keyBrightness, brightness.index);
  }

  static Brightness getBrightness() {
    if (_preferences == null) {
      return Brightness.light;
    }
    final brightnessIndex = _preferences!.getInt(_keyBrightness) ?? 0;
    return Brightness.values[brightnessIndex];
  }
}
