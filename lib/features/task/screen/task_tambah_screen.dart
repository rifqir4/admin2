import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/app_theme.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/core/widget/input_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_fields/form_builder_fields.dart';

class TaskTambahScreen extends StatelessWidget {
  TaskTambahScreen({Key key}) : super(key: key);

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
                      "New Task Form",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    InputTemplate(
                      lable: "Title",
                      inputField: FormBuilderTextField(
                        name: 'title',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            hintText: "Type the new task title",
                            prefixIcon: Icon(Icons.edit)),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InputTemplate(
                      lable: "Clinic",
                      inputField: FormBuilderSearchableDropdown(
                        name: 'clinic',
                        autoFocusSearchBox: true,
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Select clinic",
                          prefixIcon: Icon(Icons.build),
                        ),
                        items: ["RS Harapan", "RS Mantap Jiwa"],
                        onChanged: (val) => print(val),
                      ),
                    ),
                    InputTemplate(
                      lable: "Label",
                      inputField: FormBuilderTextField(
                        enabled: false,
                        name: 'label',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Clinic prioriy label",
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InputTemplate(
                      lable: "Job",
                      inputField: FormBuilderDropdown(
                        name: 'job',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Select job desc",
                        ),
                        items: [
                          DropdownMenuItem(
                              child: Text("Visit"), value: "visit"),
                          DropdownMenuItem(
                              child: Text("Delivery"), value: "deliv")
                        ],
                      ),
                    ),
                    InputTemplate(
                      lable: "Description",
                      inputField: FormBuilderTextField(
                        name: 'desc',
                        maxLines: 3,
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Task description here..",
                        ),
                      ),
                    ),
                    InputTemplate(
                      lable: "Deadline Date",
                      inputField: FormBuilderDateTimePicker(
                        alwaysUse24HourFormat: true,
                        name: 'deadline',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: "Deadline date here..",
                        ),
                      ),
                    ),
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
