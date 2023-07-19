#import "FlutterOpenAppSettingsPlugin.h"
#if __has_include(<flutter_open_app_settings/flutter_open_app_settings-Swift.h>)
#import <flutter_open_app_settings/flutter_open_app_settings-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_open_app_settings-Swift.h"
#endif

@implementation FlutterOpenAppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterOpenAppSettingsPlugin registerWithRegistrar:registrar];
}
@end
