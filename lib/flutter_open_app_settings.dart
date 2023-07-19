// ignore_for_file: always_specify_types

/*@Author Hina Hussain on 5-May-2021
  @Author Joseph Crowell  on 19-Jul-2023
* */

import 'dart:async';
import 'package:flutter/services.dart';

/// [SettingsCode] defined all enums that are supported by flutter_open_app_settings plugin.
/// [
///  APP_SETTINGS,
//   BLUETOOTH,
//   WIFI,
//   ACCESSIBILITY,
//   ADD_ACCOUNT,
//   AIRPLANE_MODE,
//   APN,
//   ALL_APPS_SETTINGS,
//   BATTERY_SAVER,
//   KEYBOARD,
//   DATA_USAGE,
//   DATE,
//   DEVICE_INFO,
//   DISPLAY,
//   HOME,
//   INTERNAL_STORAGE,
//   FINGERPRINT_ENROLL,
//   LOCALE,
//   LOCATION,
//   PRIVACY,
//   BATTERY_OPTIMIZATION,
//   NFC,
//   SOUND,
//   NOTIFICATION,
/// ]
enum SettingsCode {
  APP_SETTINGS,
  BLUETOOTH,
  WIFI,
  ACCESSIBILITY,
  ADD_ACCOUNT,
  AIRPLANE_MODE,
  APN,
  ALL_APPS_SETTINGS,
  BATTERY_SAVER,
  KEYBOARD,
  DATA_USAGE,
  DATE,
  DEVICE_INFO,
  DISPLAY,
  HOME,
  INTERNAL_STORAGE,
  FINGERPRINT_ENROLL,
  LOCALE,
  LOCATION,
  PRIVACY,
  BATTERY_OPTIMIZATION,
  NFC,
  SOUND,
  NOTIFICATION,
}

/// An [FlutterOpenAppSettings] class is responsible for Opening settings pages for the application.
class FlutterOpenAppSettings {
  static const MethodChannel _channel =
      MethodChannel('flutter_open_app_settings');

  ///[openAppsSettings] method is used to open settings.
  /// As an input user will specify which settings should be open via [SettingsCode].
  /// All [SettingsCode] are defined in [SettingsCode] enum.
  /// [onCompletion] method parameter is optional.
  /// If user wants to execute something after returning back from settings then can pass
  /// through [onCompletion] method

  static Future<void> openAppsSettings({
    required SettingsCode settingsCode,
    Function? onCompletion,
  }) async {
    try {
      String code = settingsCode.toString();
      code = code.substring(13);
      String res = await _channel
          .invokeMethod('openSettings', {'setting_code': code.toLowerCase()});
      if (res.isNotEmpty) {
        if (onCompletion != null) {
          onCompletion();
        }
      }
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
        stacktrace: e.stacktrace,
      );
    }
  }
}
