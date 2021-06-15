import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/app_theme.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/core/widget/input_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_fields/form_builder_fields.dart';

class TaskLaporScreen extends StatelessWidget {
  TaskLaporScreen({Key key}) : super(key: key);

  final _formKey = new GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Add New Task",
      ),
      body: Column(
        children: [
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Daily Report Form",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    InputTemplate(
                      lable: "Task Id",
                      inputField: FormBuilderTextField(
                        name: 'taskId',
                        enabled: false,
                        decoration: AppTheme.inputFieldTheme,
                        initialValue: "12",
                      ),
                    ),
                    InputTemplate(
                      lable: "Task Title",
                      inputField: FormBuilderTextField(
                        name: 'title',
                        enabled: false,
                        decoration: AppTheme.inputFieldTheme,
                        textInputAction: TextInputAction.next,
                        initialValue: "Visitng ke Rumah Sakit",
                      ),
                    ),
                    InputTemplate(
                      lable: "Clinic",
                      inputField: FormBuilderTextField(
                        name: 'clinic',
                        enabled: false,
                        decoration: AppTheme.inputFieldTheme,
                        textInputAction: TextInputAction.next,
                        initialValue: "RS. Bayangkara",
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Daily Stock Form",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        SizedBox(width: 15),
                        ElevatedButton(
                            onPressed: () {
                              _formKey.currentState.save();
                              print(_formKey.currentState.value);
                            },
                            child: Text("Save")),
                      ],
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
