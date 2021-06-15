import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/app_theme.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/core/widget/input_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_fields/form_builder_fields.dart';

class AkunTambahScreen extends StatelessWidget {
  AkunTambahScreen({Key key}) : super(key: key);

  final _formKey = new GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Tambah Akun Baru",
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
                      "Form Akun Baru",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    InputTemplate(
                      lable: "Username",
                      inputField: FormBuilderTextField(
                        name: 'username',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            hintText: "Type for the username",
                            prefixIcon: Icon(Icons.person)),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InputTemplate(
                      lable: "Password",
                      inputField: FormBuilderTextField(
                        name: 'password',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Type for the password"),
                        obscureText: true,
                      ),
                    ),
                    InputTemplate(
                      lable: 'Confirm Password',
                      inputField: FormBuilderTextField(
                        name: 'repeatpassword',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Repeat Password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    InputTemplate(
                      lable: "Role",
                      inputField: FormBuilderDropdown(
                        name: 'role',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          prefixIcon: Icon(Icons.window),
                          hintText: "Pilih Role",
                        ),
                        initialValue: "admin",
                        items: [
                          DropdownMenuItem(
                              child: Text("Admin"), value: "admin"),
                          DropdownMenuItem(child: Text("Sales"), value: "sales")
                        ],
                      ),
                    ),
                    InputTemplate(
                      lable: "Contact",
                      inputField: FormBuilderSearchableDropdown(
                        name: 'contact',
                        autoFocusSearchBox: true,
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          hintText: "Select contact person",
                          prefixIcon: Icon(Icons.phone),
                        ),
                        items: ["Rifqi Radifan", "Salsabiil Hasanah"],
                        onChanged: (val) => print(val),
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
