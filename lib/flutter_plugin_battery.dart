
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginBattery {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_battery');

  static Future<int> get platformBattery async {
    final int battery = await _channel.invokeMethod('getPlatformBattery');
    return battery;
  }
}
