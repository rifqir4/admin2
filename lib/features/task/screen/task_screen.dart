import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Task Management",
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Task List",
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
                        Navigator.pushNamed(context, RouteConst.taskTambah);
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
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(
                            label: Text("Id",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Title",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Status",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Lable",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Created By",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Deadline",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(
                            onSelectChanged: (value) => Navigator.pushNamed(
                                context, RouteConst.taskLapor),
                            cells: [
                              DataCell(Text("1")),
                              DataCell(Text("Task 1")),
                              DataCell(Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                              DataCell(Text("Visiting")),
                              DataCell(Text("Me")),
                              DataCell(Text("12 June 2021")),
                            ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("Task 2")),
                          DataCell(Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              "On Going",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                          DataCell(Text("Prospecting")),
                          DataCell(Text("Me")),
                          DataCell(Text("12 June 2021")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("3")),
                          DataCell(Text("Task 3")),
                          DataCell(Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Expired",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                          DataCell(Text("Prospecting")),
                          DataCell(Text("Supervisor")),
                          DataCell(Text("12 June 2021")),
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
