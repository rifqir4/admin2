import 'package:admin2/core/provider/global_provider.dart';
import 'package:admin2/core/settings/responsive.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/custom_dialog.dart';
import 'package:admin2/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context)) ...[
          IconButton(onPressed: context.read<GlobalProvider>().sideMenuControl, icon: Icon(Icons.menu)),
          SizedBox(width: 20),
        ],
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue, letterSpacing: 1.2),
        ),
        Spacer(),
        Text(
          "Rifqi Radifan",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 20),
        CircleAvatar(
          radius: 12,
          child: Icon(Icons.person, size: 20),
        ),
        SizedBox(width: 5),
        PopupMenuButton(
          onSelected: (value) async {
            switch (value) {
              case "Logout":
                CustomDialog.loadingDialog(context);
                await context.read<AuthProvider>().logout();
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, RouteConst.login, (route) => false);
                break;
              default:
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Logout',
              child: Row(children: [Icon(Icons.logout), SizedBox(width: 8), Text("Logout")]),
            ),
          ],
        )
      ],
    );
  }
}
