import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'apple_keychain_method_channel.dart';

abstract class AppleKeychainPlatform extends PlatformInterface {
  AppleKeychainPlatform() : super(token: _token);
  static final Object _token = Object();
  static AppleKeychainPlatform _instance = MethodChannelAppleKeychain();
  static AppleKeychainPlatform get instance => _instance;

  static set instance(AppleKeychainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> write(
      {required String key, required String value, String? suite}) {
    throw UnimplementedError(
        'platformVersion() has not been implemented. Only IOS is Supported');
  }

  Future<String?> read({required String key, String? suite}) {
    throw UnimplementedError(
        'platformVersion() has not been implemented. Only IOS is Supported');
  }

  Future<String?> uuid() {
    throw UnimplementedError(
        'platformVersion() has not been implemented. Only IOS is Supported');
  }
}
