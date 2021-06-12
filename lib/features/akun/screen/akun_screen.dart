import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:flutter/material.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Akun",
      ),
      body: Center(
        child: Text("Akun"),
      ),
    );
  }
}
