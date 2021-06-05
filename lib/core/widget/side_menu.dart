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
                child: Text(
              "Admin CRM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2),
            )),
            DrawerListTile(title: "Dashboard", icon: Icons.speed, press: () {}),
            DrawerListTile(title: "Akun", icon: Icons.group, press: () {}),
          ],
        ),
      ),
    );
  }
}
