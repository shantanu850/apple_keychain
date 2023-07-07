import Flutter
import UIKit

public class AppleKeychainPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "apple_keychain", binaryMessenger: registrar.messenger())
    let instance = AppleKeychainPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let args = call.arguments as! [String : String]
      let key = args["key"]
      let value = args["value"]
      let suiteName = args["suite_name"]
        if call.method == "write" {
            let res = write(
              key: key,
              value: value,
              suiteName: suiteName)
            result(res)
        }
        if call.method == "read"{
            let res = read(
              key: key,
              suiteName: suiteName)
            result(res)
        }
        if call.method == "uuid"{
            let res = self.uuid()
            result(res)
        }
        if call.method == "getPlatformVersion"{
            result("iOS " + UIDevice.current.systemVersion)
        }
    }

    private func write(
      key: String?,
      value: String?,
      suiteName: String?) -> String? {
      guard let sharedUserDefaults = UserDefaults(suiteName: suiteName)
          else {
          return "false"
      }
      sharedUserDefaults.set(value, forKey: key ?? "key")
      return "true"
    }
    private func read(key: String?,suiteName: String?) -> String? {
      guard let sharedUserDefaults = UserDefaults(suiteName: suiteName)
        else {
        return nil
      }
      guard let migratedData = sharedUserDefaults.string(forKey: key ?? "key") else {
          return nil
      }
      return migratedData
    }

    private func uuid() -> String {
      let uuid = UIDevice.current.identifierForVendor?.uuidString
        return uuid ?? UUID().uuidString
    }
}
