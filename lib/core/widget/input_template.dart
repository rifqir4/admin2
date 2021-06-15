import 'package:flutter/material.dart';

class InputTemplate extends StatelessWidget {
  final String lable;
  final Widget inputField;

  const InputTemplate({
    this.lable,
    this.inputField,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            lable,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          Expanded(flex: 3, child: inputField),
        ],
      ),
    );
  }
}
