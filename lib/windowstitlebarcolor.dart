import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'windowstitlebarcolor_platform_interface.dart';

class Windowstitlebarcolor {
  static Future<void> setTitleBarColor(Color color) async {
    if (!kIsWeb && Platform.isWindows) {
      await WindowstitlebarcolorPlatform.instance.setTitleBarColor(color);
    }
  }
}
