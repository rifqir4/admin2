import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.warning, size: 50),
            SizedBox(height: 30),
            Text("Halaman Tidak Ditemukan"),
          ],
        ),
      ),
    );
  }
}
