import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogin = false;

  Future<bool> login() async {
    await Future.delayed(Duration(seconds: 2));
    isLogin = true;
    return isLogin;
  }

  Future<bool> checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    return isLogin;
  }

  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 2));
    isLogin = false;
    return isLogin;
  }
}
