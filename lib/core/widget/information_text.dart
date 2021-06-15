import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  final String label;
  final String text;
  final int flex;
  const InformationText({this.label, this.text, this.flex = 3, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(label)),
          Expanded(flex: flex, child: Text(": $text"))
        ],
      ),
    );
  }
}
