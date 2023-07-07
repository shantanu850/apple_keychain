import 'package:flutter_test/flutter_test.dart';
import 'package:apple_keychain/apple_keychain.dart';
import 'package:apple_keychain/apple_keychain_platform_interface.dart';
import 'package:apple_keychain/apple_keychain_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppleKeychainPlatform
    with MockPlatformInterfaceMixin
    implements AppleKeychainPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> read({required String key, String? suite}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<String?> uuid() {
    // TODO: implement uuid
    throw UnimplementedError();
  }

  @override
  Future<String?> write({required String key, required String value, String? suite}) {
    // TODO: implement write
    throw UnimplementedError();
  }
}

void main() {
  final AppleKeychainPlatform initialPlatform = AppleKeychainPlatform.instance;

  test('$MethodChannelAppleKeychain is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppleKeychain>());
  });

  test('getPlatformVersion', () async {
    AppleKeychain appleKeychainPlugin = AppleKeychain();
    MockAppleKeychainPlatform fakePlatform = MockAppleKeychainPlatform();
    AppleKeychainPlatform.instance = fakePlatform;

    expect(await appleKeychainPlugin.getPlatformVersion(), '42');
  });
}
