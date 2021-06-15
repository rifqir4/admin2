import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Contaact",
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Daftar Contact",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: 200,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          hintText: "Search",
                          suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.search, size: 20)),
                          suffixIconConstraints: BoxConstraints(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      splashRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConst.contactTambah);
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
                        DataColumn(
                            label: Text("Id",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Nama",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Role",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Rifan")),
                          DataCell(Text("Admin")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("Rifan")),
                          DataCell(Text("Admin")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("3")),
                          DataCell(Text("Rifan")),
                          DataCell(Text("Admin")),
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
