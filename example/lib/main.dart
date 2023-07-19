import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_app_settings/flutter_open_app_settings.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late Function _function;

  @override
  void initState() {
    super.initState();
    _function = () {
      if (kDebugMode) {
        print('do stuff here After returning back to setting page!');
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Open Apps Setting Plugin Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.APP_SETTINGS,
                      onCompletion: _function,
                    );
                  },
                  child: const Text('OPEN APP SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.BLUETOOTH,
                    );
                  },
                  child: const Text('OPEN BLUETOOTH SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.WIFI,
                    );
                  },
                  child: const Text('OPEN WIFI SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.ACCESSIBILITY,
                    );
                  },
                  child: const Text('OPEN ACCESSIBILITY SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.ADD_ACCOUNT,
                    );
                  },
                  child: const Text('OPEN ADD ACCOUNT SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.AIRPLANE_MODE,
                    );
                  },
                  child: const Text('OPEN AIRPLANE SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.ALL_APPS_SETTINGS,
                    );
                  },
                  child: const Text('OPEN ALL APP SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.APN,
                    );
                  },
                  child: const Text('OPEN APN SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.BATTERY_SAVER,
                    );
                  },
                  child: const Text('OPEN BATTERY SAVER SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.KEYBOARD,
                    );
                  },
                  child: const Text('OPEN KEYBOARD SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.DATA_USAGE,
                    );
                  },
                  child: const Text('OPEN DATA USAGE SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.DATE,
                    );
                  },
                  child: const Text('OPEN DATE SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.DEVICE_INFO,
                    );
                  },
                  child: const Text('OPEN DEVICE INFO SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.DISPLAY,
                    );
                  },
                  child: const Text('OPEN DISPLAY SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.HOME,
                    );
                  },
                  child: const Text('OPEN HOME SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.INTERNAL_STORAGE,
                    );
                  },
                  child: const Text('OPEN INTERNAL STORAGE SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.NFC,
                    );
                  },
                  child: const Text('OPEN NFC SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.NOTIFICATION,
                    );
                  },
                  child: const Text('OPEN NOTIFICATION SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.SOUND,
                    );
                  },
                  child: const Text('OPEN SOUND SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.BATTERY_OPTIMIZATION,
                    );
                  },
                  child: const Text('OPEN BATTERY OPTIMIZATION SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.LOCATION,
                    );
                  },
                  child: const Text('OPEN LOCATION SETTINGS'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterOpenAppSettings.openAppsSettings(
                      settingsCode: SettingsCode.LOCALE,
                    );
                  },
                  child: const Text('OPEN LOCALE SETTINGS'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
