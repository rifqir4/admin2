import 'package:admin2/core/widget/information_text.dart';
import 'package:flutter/material.dart';

class PresensiDetail extends StatelessWidget {
  const PresensiDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Presensi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(child: Text("Task")),
                      Expanded(
                        flex: 3,
                        child: DropdownButton(
                          style: TextStyle(fontSize: 14),
                          value: 1,
                          onChanged: (val) {},
                          isDense: true,
                          items: [
                            DropdownMenuItem(child: Text("Task ID"), value: 1),
                            DropdownMenuItem(child: Text("Task ID"), value: 2),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                InformationText(label: "Lat", text: "-6.2131231"),
                InformationText(label: "Long", text: "107.654312"),
                InformationText(label: "Tanggal", text: "20 Juni 2021"),
                InformationText(label: "Jam", text: "19:00 WIB"),
                Divider(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: TextStyle(fontSize: 15, letterSpacing: 1.2),
                    ),
                    icon: Icon(Icons.check_circle_outline),
                    label: Text("Presensi"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
