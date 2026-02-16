import 'package:flutter/foundation.dart';
import '../models/user.dart';

// TODO: Implement authentication state management

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;
  bool _isLoading = false;

  User? get user => _user;
  String? get token => _token;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _token != null;

  Future<void> login(String email, String password) async {
    // TODO: Call AuthService.login, store token, fetch user
    throw UnimplementedError();
  }

  Future<void> register(String email, String username, String password) async {
    // TODO: Call AuthService.register
    throw UnimplementedError();
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    notifyListeners();
  }
}
