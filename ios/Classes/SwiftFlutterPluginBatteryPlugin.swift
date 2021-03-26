import Flutter
import UIKit
public class SwiftFlutterPluginBatteryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_battery", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPluginBatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if ("getPlatformBattery" == call.method) {
        receiveBatteryLevel(result: result);
      } else {
        result(FlutterMethodNotImplemented);
      }
  }
    
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current;
      device.isBatteryMonitoringEnabled = true;
        if (device.batteryState == UIDevice.BatteryState.unknown) {
        result(FlutterError.init(code: "UNAVAILABLE",
                                 message: "电池信息不可用",
                                 details: nil));
      } else {
        result(Int(device.batteryLevel * 100));
      }
    }
}
