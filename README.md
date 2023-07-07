# Flutter Keychain Access Plugin

A Flutter plugin that provides keychain access for securely storing and retrieving data on iOS. It also allows data sharing between apps using the same app group identifier.

## Features

- Securely store data in the iOS keychain.
- Retrieve stored data from the keychain.
- Share data between multiple apps using a common app group identifier.

## Usage

To use this plugin, add `apple_keychain` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  apple_keychain: ^1.0.0
```

Then, import the library into your Dart code:

```dart
import 'package:apple_keychain/apple_keychain.dart';
```

### Storing Data

To store data in the keychain, use the `write` method:

```dart
String key = 'myKey';
String value = 'myValue';
await AppleKeychain.write(key: key, value: value);
```

### Retrieving Data

To retrieve data from the keychain, use the `read` method:

```dart
String key = 'myKey';
String value = await AppleKeychain.read(key: key);
```

### Sharing Data Between Apps

To share data between multiple apps using the same app group identifier, set the `accessGroup` parameter when reading or writing data:

```dart
String key = 'myKey';
String value = 'myValue';
String accessGroup = 'com.example.appgroup';
await AppleKeychain.write(key: key, value: value, accessGroup: accessGroup);

String sharedValue = await AppleKeychain.read(key: key, accessGroup: accessGroup);
```

Make sure to configure the appropriate app group identifier in your Xcode project settings.

For more detailed usage examples, please refer to the [example](https://github.com/shantanu850/apple_keychain) provided.

## Issues and Contributions

Please report any issues or bugs you encounter by creating an issue on the [GitHub repository](https://github.com/your-plugin-repo/issues). Contributions are always welcome!

## License

This plugin is released under the [MIT License](https://opensource.org/licenses/MIT).
```