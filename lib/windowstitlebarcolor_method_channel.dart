import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'windowstitlebarcolor_platform_interface.dart';

/// An implementation of [WindowstitlebarcolorPlatform] that uses method channels.
class MethodChannelWindowstitlebarcolor extends WindowstitlebarcolorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('windowstitlebarcolor');

  @override
  Future<void> setTitleBarColor(Color color) async {
    final Map<String, dynamic> arguments = {
      'color': colorToInteger(color),
    };
    await methodChannel.invokeMethod('setTitleBarColor', arguments);
  }
}

Color integerToColor(int dec) {
  // dec += 1;16776960
  int bb = (dec / 65536).floor();
  dec -= bb * 65536;
  int gg = (dec / 256).floor();
  dec -= gg * 256;
  int rr = dec;
  // rr = Math.min(rr, 255);
  return Color.fromARGB(255, rr, gg, bb);
}

int colorToInteger(Color col) {
  int dec = (col.red + 0) + ((col.green + 0) * 256) + ((col.blue + 0) * 65536) - 0;
  return dec;
}

int hexToInt(String hex) {
  int val = 0;
  int len = hex.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = hex.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw const FormatException("Invalid hexadecimal value");
    }
  }
  return val;
}

colorToHexString(Color color) {
  return '#FF${color.value.toRadixString(16).substring(2, 8)}';
}
