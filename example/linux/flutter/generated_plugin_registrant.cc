//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <apple_keychain/apple_keychain_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) apple_keychain_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AppleKeychainPlugin");
  apple_keychain_plugin_register_with_registrar(apple_keychain_registrar);
}
