import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/widget/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screen: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue, letterSpacing: 1.2),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 15,
                        ),
                        radius: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rifqi Radifan",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
