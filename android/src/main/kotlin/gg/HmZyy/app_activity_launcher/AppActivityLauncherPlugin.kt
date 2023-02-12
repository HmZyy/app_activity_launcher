package gg.HmZyy.app_activity_launcher

import androidx.annotation.NonNull
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.content.Context
import android.net.Uri


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AppActivityLauncherPlugin */
class AppActivityLauncherPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_activity_launcher")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "openApp" -> {
                val appId = call.argument<String>("appId")
                val res = openApp(appId)
                result.success(res)
            }
            "openMarket" -> {
                val appId = call.argument<String>("appId")
                val res = openMarket(appId)
                result.success(res)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun openApp(appId: String?): Boolean {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
        if (appId != null)
            intent.setPackage(appId)
        try {
            context.startActivity(intent)
            return true
        } catch (e: Exception) {
            return false
        }
    }

    private fun openMarket(appId: String?): Boolean {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
        if (appId != null)
            intent.data = Uri.parse("market://details?id=$appId")
        try {
            context.startActivity(intent)
            return true
        } catch (e: Exception) {
            return false
        }
    }

}
