import 'api_client.dart';

// TODO: Implement authentication service

class AuthService {
  final ApiClient _api;

  AuthService(this._api);

  Future<void> register(String email, String username, String password) async {
    // TODO: POST /auth/register
    throw UnimplementedError();
  }

  Future<String> login(String email, String password) async {
    // TODO: POST /auth/login, return JWT token
    throw UnimplementedError();
  }

  Future<void> logout() async {
    // TODO: Clear stored token
    throw UnimplementedError();
  }
}
