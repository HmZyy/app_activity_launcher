import 'package:flutter_test/flutter_test.dart';
import 'package:app_activity_launcher/app_activity_launcher.dart';
import 'package:app_activity_launcher/app_activity_launcher_platform_interface.dart';
import 'package:app_activity_launcher/app_activity_launcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppActivityLauncherPlatform
    with MockPlatformInterfaceMixin
    implements AppActivityLauncherPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppActivityLauncherPlatform initialPlatform = AppActivityLauncherPlatform.instance;

  test('$MethodChannelAppActivityLauncher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppActivityLauncher>());
  });

  test('getPlatformVersion', () async {
    AppActivityLauncher appActivityLauncherPlugin = AppActivityLauncher();
    MockAppActivityLauncherPlatform fakePlatform = MockAppActivityLauncherPlatform();
    AppActivityLauncherPlatform.instance = fakePlatform;

    expect(await appActivityLauncherPlugin.getPlatformVersion(), '42');
  });
}
