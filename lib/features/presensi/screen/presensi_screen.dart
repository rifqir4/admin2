import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/responsive.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/features/presensi/provider/presensi_provider.dart';
import 'package:admin2/features/presensi/widget/presensi_detail.dart';
import 'package:admin2/features/presensi/widget/presensi_map.dart';
import 'package:admin2/features/presensi/widget/presensi_task_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Provider<PresensiProvider>(
        create: (_) => PresensiProvider(),
        child: Column(
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
                      Expanded(flex: 2, child: PresensiMap()),
                      if (!Responsive.isMobile(context)) ...[
                        SizedBox(width: 8),
                        Expanded(
                          child: PresensiDetail(),
                        )
                      ]
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isMobile(context)) ...[
              SizedBox(height: 10),
              PresensiDetail()
            ],
            SizedBox(height: 10),
            PresensiTaskList(),
          ],
        ),
      ),
    );
  }
}
