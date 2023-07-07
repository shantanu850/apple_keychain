#ifndef FLUTTER_PLUGIN_APPLE_KEYCHAIN_PLUGIN_H_
#define FLUTTER_PLUGIN_APPLE_KEYCHAIN_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace apple_keychain {

class AppleKeychainPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AppleKeychainPlugin();

  virtual ~AppleKeychainPlugin();

  // Disallow copy and assign.
  AppleKeychainPlugin(const AppleKeychainPlugin&) = delete;
  AppleKeychainPlugin& operator=(const AppleKeychainPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace apple_keychain

#endif  // FLUTTER_PLUGIN_APPLE_KEYCHAIN_PLUGIN_H_
