import 'package:flutter/material.dart';

class PresensiTaskList extends StatelessWidget {
  const PresensiTaskList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "List Task Hari Ini",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.timeline),
                  title: Text("Task 1"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ket: Sudah Absen"),
                      Text("(-6.23232, 107.123122322)"),
                    ],
                  ),
                  trailing: CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.check, size: 15),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.timeline),
                  title: Text("Task 2"),
                  subtitle: Text("Ket: Belum Absen"),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 15,
                    child: Icon(Icons.close, size: 15),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
