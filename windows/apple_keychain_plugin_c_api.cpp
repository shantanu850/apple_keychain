#include "include/apple_keychain/apple_keychain_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "apple_keychain_plugin.h"

void AppleKeychainPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  apple_keychain::AppleKeychainPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
