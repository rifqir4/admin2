import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Future<bool> login() async {
    final _sp = await SharedPreferences.getInstance();
    final bool isLogin = await _sp.setBool('isLogin', true);
    await Future.delayed(Duration(seconds: 2));
    return isLogin;
  }

  Future<bool> checkLogin() async {
    final _sp = await SharedPreferences.getInstance();
    final bool isLogin = _sp.containsKey('isLogin') ? _sp.getBool('isLogin') : false;
    await Future.delayed(Duration(seconds: 2));
    return isLogin;
  }

  Future<bool> logout() async {
    final _sp = await SharedPreferences.getInstance();
    final bool isLogin = await _sp.setBool('isLogin', false);
    await Future.delayed(Duration(seconds: 2));
    return isLogin;
  }
}
