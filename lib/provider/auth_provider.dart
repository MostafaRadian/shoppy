import 'package:flutter/cupertino.dart';
import 'package:shop_app_simple_1/models/auth_model.dart';
import 'package:shop_app_simple_1/services/services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? user;

  Future<bool> logUser({
    required String email,
    required String password,
  }) async {
    final response = await AuthService.signIn(email: email, password: password);

    if (response != null) {
      user = response; // store logged-in user
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signUpUser({
    required String email,
    required String password,
  }) async {
    final response = await AuthService.signUp(email: email, password: password);

    if (response != null) {
      user = response; // store newly signed up user
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logOutUser() async {
    await AuthService.signOut();
    user = null;
    notifyListeners();
  }
}
