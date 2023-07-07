import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'apple_keychain_platform_interface.dart';

class MethodChannelAppleKeychain
    extends AppleKeychainPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('apple_keychain');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> write({
    required String key,
    required String value,
    String? suite,
  }) async {
    final String? version = await methodChannel.invokeMethod(
      'write',
      <String, dynamic>{
        'key': key,
        'value': value,
        'suite_name': suite??"",
      },
    );
    return version;
  }

  @override
  Future<String?> read({
    required String key,
    String? suite,
  }) async {
    return await methodChannel.invokeMethod(
      'read',
      <String, dynamic>{
        'key': key,
        'value': "",
        'suite_name': suite??"",
      },
    );
  }

  @override
  Future<String?> uuid() async {
    return await methodChannel.invokeMethod(
      'uuid',
      <String, dynamic>{
        'key': "",
        'value': "",
        'suite_name': "",
      },
    );
  }
}
