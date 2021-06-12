import 'package:admin2/features/auth/provider/auth_provider.dart';
import 'package:admin2/core/screen/loading_screen.dart';
import 'package:admin2/core/screen/unknown_screen.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/features/akun/screen/akun_screen.dart';
import 'package:admin2/features/auth/screen/login_screen.dart';
import 'package:admin2/features/home/screen/home_screen.dart';
import 'package:admin2/features/presensi/screen/presensi_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSettings {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page = UnknownScreen();

    if (settings.name == RouteConst.login) page = LoginScreen();
    if (settings.name == RouteConst.home) page = HomeScreen();
    if (settings.name == RouteConst.akun) page = AkunScreen();
    if (settings.name == RouteConst.presensi) page = PresensiScreen();

    return MaterialPageRoute(
      builder: (context) => FutureBuilder<bool>(
        future: context.read<AuthProvider>().checkLogin(),
        builder: (context, snap) => snap.connectionState != ConnectionState.done
            ? LoadingScreen()
            : !snap.data
                ? LoginScreen()
                : page,
      ),
    );
  }
}
