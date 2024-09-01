import 'package:flutter_test/flutter_test.dart';
import 'package:windowstitlebarcolor/windowstitlebarcolor.dart';
import 'package:windowstitlebarcolor/windowstitlebarcolor_platform_interface.dart';
import 'package:windowstitlebarcolor/windowstitlebarcolor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowstitlebarcolorPlatform
    with MockPlatformInterfaceMixin
    implements WindowstitlebarcolorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WindowstitlebarcolorPlatform initialPlatform = WindowstitlebarcolorPlatform.instance;

  test('$MethodChannelWindowstitlebarcolor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowstitlebarcolor>());
  });

  test('getPlatformVersion', () async {
    Windowstitlebarcolor windowstitlebarcolorPlugin = Windowstitlebarcolor();
    MockWindowstitlebarcolorPlatform fakePlatform = MockWindowstitlebarcolorPlatform();
    WindowstitlebarcolorPlatform.instance = fakePlatform;

    expect(await windowstitlebarcolorPlugin.getPlatformVersion(), '42');
  });
}
