import 'package:admin2/core/widget/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget screen;
  const MainScreen({Key key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(flex: 5, child: screen),
          ],
        ),
      ),
    );
  }
}
