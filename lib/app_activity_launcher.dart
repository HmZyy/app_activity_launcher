import 'app_activity_launcher_platform_interface.dart';

class AppActivityLauncher {
  Future<String?> getPlatformVersion() {
    return AppActivityLauncherPlatform.instance.getPlatformVersion();
  }

  Future<bool?> openApp({required String appId, Map<String, String>? extras}) {
    return AppActivityLauncherPlatform.instance.openApp(
        appId: appId, extras: extras);
  }

  Future<bool?> openMarket(
      {required String appId, Map<String, String>? extras}) {
    return AppActivityLauncherPlatform.instance.openMarket(
        appId: appId, extras: extras);
  }

  Future<bool?> openActivity(
      {required String appId, required String activity, Map<String,
          String>? extras}) {
    return AppActivityLauncherPlatform.instance.openActivity(
        appId: appId, activity: activity, extras: extras);
  }
}
