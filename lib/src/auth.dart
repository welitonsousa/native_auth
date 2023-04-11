import 'package:local_auth/local_auth.dart';
import 'package:native_auth/native_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

/// the [Auth] class is used to authenticate the user.
class Auth {
  /// isAuthenticate is a method that returns a [Future] of [AuthResult].
  ///
  /// if the user is authenticated, it returns [AuthResult.auth].
  ///
  /// if the user has no authentication method, returns the param [noAuthMethodsReturn -> default auth].
  ///
  /// if the user is not authenticated, it returns [AuthResult.noAuth].
  ///
  /// if there is an error, it returns [AuthResult.error].
  ///
  static Future<AuthResult> isAuthenticate({
    String description = 'Please authenticate to show account balance',
    AuthResult noAuthMethodsReturn = AuthResult.auth,
    String? title,
  }) async {
    try {
      final auth = LocalAuthentication();
      final availableBiometrics = await auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) return noAuthMethodsReturn;

      final bool did = await auth.authenticate(
        localizedReason: description,
        authMessages: <AuthMessages>[
          AndroidAuthMessages(signInTitle: title),
          IOSAuthMessages(localizedFallbackTitle: title),
        ],
      );
      if (did) return AuthResult.auth;
      return AuthResult.noAuth;
    } catch (e) {
      return AuthResult.error;
    }
  }
}
