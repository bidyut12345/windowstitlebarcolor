import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'windowstitlebarcolor_method_channel.dart';

abstract class WindowstitlebarcolorPlatform extends PlatformInterface {
  /// Constructs a WindowstitlebarcolorPlatform.
  WindowstitlebarcolorPlatform() : super(token: _token);

  static final Object _token = Object();

  static WindowstitlebarcolorPlatform _instance = MethodChannelWindowstitlebarcolor();

  /// The default instance of [WindowstitlebarcolorPlatform] to use.
  ///
  /// Defaults to [MethodChannelWindowstitlebarcolor].
  static WindowstitlebarcolorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WindowstitlebarcolorPlatform] when
  /// they register themselves.
  static set instance(WindowstitlebarcolorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setTitleBarColor(Color color) {
    throw UnimplementedError('setTitleBarColor() has not been implemented.');
  }
}
