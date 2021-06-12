import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/features/presensi/widget/presensi_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PresensiScreen extends StatefulWidget {
  const PresensiScreen({Key key}) : super(key: key);

  @override
  _PresensiScreenState createState() => _PresensiScreenState();
}

class _PresensiScreenState extends State<PresensiScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(title: "Presensi"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: PresensiMap()),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Presensi",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Divider(),
                            Row(
                              children: [Expanded(flex: 1, child: Text("Lat")), Expanded(flex: 3, child: Text(": -6.12323123"))],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
