import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: Center(
              child: Text(
                "Admin CRM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2),
              ),
            )),
            DrawerListTile(title: "Dashboard", icon: Icons.speed, routeName: RouteConst.home),
            DrawerListTile(title: "Presensi", icon: Icons.map, routeName: RouteConst.presensi),
            DrawerListTile(title: "Akun", icon: Icons.group, routeName: RouteConst.akun),
          ],
        ),
      ),
    );
  }
}
