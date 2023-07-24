/*@Author Hina Hussain Created Date 5-May-2021*/
package com.josephcrowell.flutter_open_app_settings

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

/** FlutterOpenAppSettingsPlugin  */
class FlutterOpenAppSettingsPlugin : FlutterPlugin, MethodCallHandler, ActivityResultListener,
    ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private var channel: MethodChannel? = null
    private var activity: Activity? = null
    private var activityRes: MethodChannel.Result? = null
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_open_app_settings")
        channel!!.setMethodCallHandler(this)
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        activityRes = result
        if (call.method == "openSettings") {
            val settingCode = call.argument<String>("setting_code")
            when (settingCode ?: "") {
                "app_settings" -> openAppSettings()

                "wifi" -> openSettings(
                    Settings.ACTION_WIFI_SETTINGS,
                    RequestCodes.WIFI_SETTINGS
                )

                "bluetooth" -> openSettings(
                    Settings.ACTION_BLUETOOTH_SETTINGS,
                    RequestCodes.BLUETOOTH_SETTINGS
                )

                "accessibility" -> openSettings(
                    Settings.ACTION_ACCESSIBILITY_SETTINGS,
                    RequestCodes.ACCESSIBILITY_SETTINGS
                )

                "add_account" -> openSettings(
                    Settings.ACTION_ADD_ACCOUNT,
                    RequestCodes.ADD_ACCOUNT
                )

                "airplane_mode" -> openSettings(
                    Settings.ACTION_AIRPLANE_MODE_SETTINGS,
                    RequestCodes.AIRPLANE_MODE_SETTINGS
                )

                "apn" -> openSettings(
                    Settings.ACTION_APN_SETTINGS,
                    RequestCodes.APN_SETTINGS
                )

                "all_apps_settings" -> openSettings(
                    Settings.ACTION_APPLICATION_SETTINGS,
                    RequestCodes.APPLICATIONS_SETTINGS
                )

                "battery_saver" -> openSettings(
                    Settings.ACTION_BATTERY_SAVER_SETTINGS,
                    RequestCodes.BATTERY_SAVER_SETTINGS
                )

                "keyboard" -> openSettings(
                    Settings.ACTION_HARD_KEYBOARD_SETTINGS,
                    RequestCodes.KEYBOARD_SETTINGS
                )

                "data_usage" -> openSettings(
                    Settings.ACTION_DATA_USAGE_SETTINGS,
                    RequestCodes.DATA_USAGE_SETTINGS
                )

                "date" -> openSettings(
                    Settings.ACTION_DATE_SETTINGS,
                    RequestCodes.DATE_SETTINGS
                )

                "device_info" -> openSettings(
                    Settings.ACTION_DEVICE_INFO_SETTINGS,
                    RequestCodes.DEVICE_INFO_SETTINGS
                )

                "display" -> openSettings(
                    Settings.ACTION_DISPLAY_SETTINGS,
                    RequestCodes.DISPLAY_SETTINGS
                )

                "home" -> openSettings(
                    Settings.ACTION_HOME_SETTINGS,
                    RequestCodes.HOME_SETTINGS
                )

                "internal_storage" -> openSettings(
                    Settings.ACTION_INTERNAL_STORAGE_SETTINGS,
                    RequestCodes.INTERNAL_STORAGE_SETTINGS
                )

                "fingerprint_enroll" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R)
                    openSettings(
                        Settings.ACTION_BIOMETRIC_ENROLL,
                        RequestCodes.FINGERPRINT_ENROL
                    )
                else
                    @Suppress("DEPRECATION")
                    openSettings(
                        Settings.ACTION_FINGERPRINT_ENROLL,
                        RequestCodes.FINGERPRINT_ENROL
                    )

                "locale" -> openSettings(
                    Settings.ACTION_LOCALE_SETTINGS,
                    RequestCodes.LOCALE_SETTINGS
                )

                "location" -> openSettings(
                    Settings.ACTION_LOCATION_SOURCE_SETTINGS,
                    RequestCodes.LOCATION_SOURCE_SETTINGS
                )

                "privacy" -> openSettings(
                    Settings.ACTION_PRIVACY_SETTINGS,
                    RequestCodes.PRIVACY_SETTINGS
                )

                "battery_optimization" -> openSettings(
                    Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS,
                    RequestCodes.BATTERY_OPTIMIZATION_SETTINGS
                )

                "nfc" -> openSettings(
                    Settings.ACTION_NFC_SETTINGS,
                    RequestCodes.NFC_SETTING
                )

                "sound" -> openSettings(
                    Settings.ACTION_SOUND_SETTINGS,
                    RequestCodes.SOUND_SETTINGS
                )

                "notification" -> openNotification()

                else -> result.notImplemented()
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        channel!!.setMethodCallHandler(null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (activityRes != null) {
            activityRes!!.success("" + requestCode)
        }
        return true
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    // private method to open Application specific setting
    private fun openAppSettings() {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        intent.data = Uri.fromParts("package", activity!!.packageName, null)
        activity!!.startActivityForResult(intent, RequestCodes.APP_DETAIL_SETTINGS)
    }

    // private method to open all settings
    private fun openSettings(intentString: String, permissionCode: Int) {
        try {
            val intent = Intent(intentString)
            activity!!.startActivityForResult(intent, permissionCode)
        } catch (e: Exception) {
            openAppSettings()
        }
    }

    // private method to open notification
    private fun openNotification() {
        val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
        intent.putExtra(Settings.EXTRA_APP_PACKAGE, activity!!.packageName)
        activity!!.startActivityForResult(intent, RequestCodes.NOTIFICATION_SETTINGS)
    }
}
