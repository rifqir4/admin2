import 'package:admin2/features/akun/screen/akun_tambah_screen.dart';
import 'package:admin2/features/auth/provider/auth_provider.dart';
import 'package:admin2/core/screen/loading_screen.dart';
import 'package:admin2/core/screen/unknown_screen.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/features/akun/screen/akun_screen.dart';
import 'package:admin2/features/auth/screen/login_screen.dart';
import 'package:admin2/features/clinic/screen/clinic_screen.dart';
import 'package:admin2/features/contact/screen/contact_screen.dart';
import 'package:admin2/features/contact/screen/contact_tambah_screen.dart';
import 'package:admin2/features/home/screen/home_screen.dart';
import 'package:admin2/features/presensi/screen/presensi_screen.dart';
import 'package:admin2/features/task/screen/task_lapor_screen.dart';
import 'package:admin2/features/task/screen/task_screen.dart';
import 'package:admin2/features/task/screen/task_tambah_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSettings {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page = UnknownScreen();

    if (settings.name == RouteConst.login) page = LoginScreen();
    if (settings.name == RouteConst.home) page = HomeScreen();

    if (settings.name == RouteConst.akun) page = AkunScreen();
    if (settings.name == RouteConst.akunTambah) page = AkunTambahScreen();
    if (settings.name == RouteConst.contact) page = ContactScreen();
    if (settings.name == RouteConst.contactTambah) page = ContactTambahScreen();
    if (settings.name == RouteConst.clinic) page = ClinicScreen();
    if (settings.name == RouteConst.task) page = TaskScreen();
    if (settings.name == RouteConst.taskTambah) page = TaskTambahScreen();
    if (settings.name == RouteConst.taskLapor) page = TaskLaporScreen();
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

  static openDrawer(BuildContext context) {
    final ScaffoldState scaffoldState = context.findRootAncestorStateOfType<ScaffoldState>();
    scaffoldState.openDrawer();
  }
}
