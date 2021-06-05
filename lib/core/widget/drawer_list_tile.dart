import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      leading: Icon(icon),
      onTap: press,
    );
  }
}
