import 'apple_keychain_platform_interface.dart';

class AppleKeychain {
  /// The domain identifier of the search list.
  /// If you pass nil to this parameter,
  /// the system uses the default search list that
  /// the standard class method uses. Because a suite
  /// manages the defaults of a specified app group,
  /// a suite name must be distinct from your app’s main bundle identifier.
  /// The globalDomain is also an invalid suite name,
  /// because it isn't writeable by apps.
  final String? suite;
  AppleKeychain({this.suite});

  ///An interface to the user’s defaults database, where you store key-value pairs persistently across launches of your app.
  ///https://developer.apple.com/documentation/foundation/userdefaults
  Future<String?> read({required String key}) {
    return AppleKeychainPlatform.instance.read(key: key,suite: suite);
  }
  ///An interface to the user’s defaults database, where you store key-value pairs persistently across launches of your app.
  ///https://developer.apple.com/documentation/foundation/userdefaults
  Future<String?> write({required String key, required String value}) {
    return AppleKeychainPlatform.instance.write(key: key, value: value,suite: suite);
  }
  ///get a device vendor identifier or random uuid
  Future<String?> uuid() {
    return AppleKeychainPlatform.instance.uuid();
  }

  Future<String?> getPlatformVersion() {
    return AppleKeychainPlatform.instance.getPlatformVersion();
  }
}
