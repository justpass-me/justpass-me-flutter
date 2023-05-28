import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'justpassme_flutter_method_channel.dart';

abstract class JustpassmeFlutterPlatform extends PlatformInterface {
  /// Constructs a JustpassmeFlutterPlatform.
  JustpassmeFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static JustpassmeFlutterPlatform _instance = MethodChannelJustpassmeFlutter();

  /// The default instance of [JustpassmeFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelJustpassmeFlutter].
  static JustpassmeFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JustpassmeFlutterPlatform] when
  /// they register themselves.
  static set instance(JustpassmeFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<dynamic, dynamic>> register(
      String url, Map<String, String> headers) {
    throw UnimplementedError('register() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>> login(String url, Map<String, String> headers) {
    throw UnimplementedError('login() has not been implemented.');
  }
}
