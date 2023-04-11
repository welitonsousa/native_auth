/// The result of an authentication attempt. This is used to determine if the user is authenticated or not.
enum AuthResult {
  auth,
  noAuth,
  error;

  bool get isAuthenticated => this == AuthResult.auth;
}
