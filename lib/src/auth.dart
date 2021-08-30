import 'dart:io';
import 'package:local_auth/local_auth.dart';
import 'package:native_auth/native_auth.dart';

class Auth {
  static final _auth = LocalAuthentication();

  static Future<bool> _androidAuth(AndroidMessage androidMessage) async {
    final result = await _auth.authenticate(
      localizedReason: androidMessage.help,
      androidAuthStrings: androidMessage.message,
    );
    return result;
  }

  static Future<bool> _iosAuth(IOSMessage iosMessage) async {
    final result = await _auth.authenticate(
      localizedReason: iosMessage.help,
      iOSAuthStrings: iosMessage.message,
    );
    return result;
  }

  static Future<authResult> isAuthenticate({
    AndroidMessage? androidMessage,
    IOSMessage? iosmessage,
  }) async {
    bool auth = false;

    try {
      if (Platform.isIOS) {
        auth = await Auth._iosAuth(iosmessage ?? IOSMessage());
      }
      if (Platform.isAndroid) {
        final patternMessage = AndroidMessage(
          title: "Authentication",
          help: "user your password",
        );
        auth = await Auth._androidAuth(androidMessage ?? patternMessage);
      }

      if (auth) return authResult.auth;
      return authResult.noAuth;
    } catch (e) {
      return authResult.error;
    }
  }
}
