import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:flutter/material.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Clinic",
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Clinic List",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: 200,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black54),
                          ),
                          hintText: "Search",
                          suffixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.search, size: 20)),
                          suffixIconConstraints: BoxConstraints(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      splashRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConst.akunTambah);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      splashRadius: 20,
                      onPressed: () {
                        // Navigator.pushNamed(context, RouteConst.akunTambah);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Card(
                  elevation: 2,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("Id", style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Clinic Name", style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(Text("RS. Bayangkara")),
                          DataCell(Text("P0")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("RSU Bungsu ")),
                          DataCell(Text("P4")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("3")),
                          DataCell(Text("RS. Santosa")),
                          DataCell(Text("P3")),
                        ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
