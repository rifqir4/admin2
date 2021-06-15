import 'package:admin2/core/screen/main_screen.dart';
import 'package:admin2/core/settings/app_theme.dart';
import 'package:admin2/core/widget/header.dart';
import 'package:admin2/core/widget/input_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_fields/form_builder_fields.dart';

class ContactTambahScreen extends StatelessWidget {
  ContactTambahScreen({Key key}) : super(key: key);

  final _formKey = new GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      header: Header(
        title: "Tambah Contact Baru",
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
                      "Form Contact Baru",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    InputTemplate(
                      lable: "Name",
                      inputField: FormBuilderTextField(
                        name: 'nama',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            hintText: "Type for the name",
                            prefixIcon: Icon(Icons.person)),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InputTemplate(
                      lable: "Phone",
                      inputField: FormBuilderTextField(
                        name: 'phone',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Type for the phone"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    InputTemplate(
                      lable: "Email",
                      inputField: FormBuilderTextField(
                        name: 'email',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Type for the email"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    InputTemplate(
                      lable: 'Address',
                      inputField: FormBuilderTextField(
                        name: 'address',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                            hintText: "Type for the address",
                            prefixIcon: Icon(Icons.map_outlined)),
                        maxLines: 3,
                      ),
                    ),
                    InputTemplate(
                      lable: "Type",
                      inputField: FormBuilderDropdown(
                        name: 'type',
                        decoration: AppTheme.inputFieldTheme.copyWith(
                          prefixIcon: Icon(Icons.window),
                          hintText: "Pilih Role",
                        ),
                        initialValue: "pegawai",
                        items: [
                          DropdownMenuItem(
                              child: Text("Pegawai"), value: "pegawai"),
                          DropdownMenuItem(child: Text("Umum"), value: "umum")
                        ],
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
