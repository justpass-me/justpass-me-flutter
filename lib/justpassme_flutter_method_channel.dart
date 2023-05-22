import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'justpassme_flutter_platform_interface.dart';

/// An implementation of [JustpassmeFlutterPlatform] that uses method channels.
class MethodChannelJustpassmeFlutter extends JustpassmeFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('justpassme_flutter');

  @override
  Future<String?> register(
    String url,
    Map<String, String> headers
  ) async {
    final response = await methodChannel.invokeMethod<String>('register', {
      "url": url,
      "headers": headers
    });
    return response;
  }

  @override
  Future<String?> login(
      String url,
      Map<String, String> headers
  ) async {
    final response = await methodChannel.invokeMethod<String>('login', {
      "url": url,
      "headers": headers
    });
    return response;
  }
}
