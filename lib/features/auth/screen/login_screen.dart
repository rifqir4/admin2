import 'package:admin2/core/helper/validator.dart';
import 'package:admin2/core/settings/responsive.dart';
import 'package:admin2/core/settings/route_const.dart';
import 'package:admin2/core/widget/custom_dialog.dart';
import 'package:admin2/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Center(
        child: Container(
          padding: Responsive.isDesktop(context)
              ? EdgeInsets.symmetric(vertical: 15, horizontal: 50)
              : EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          margin: Responsive.isMobile(context)
              ? EdgeInsets.symmetric(horizontal: 15)
              : EdgeInsets.all(0),
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(height: 5),
                Text(
                  "Sign in to your account",
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Type your username"),
                      validator: Validator.cannotEmpty,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Type your password"),
                      validator: Validator.cannotEmpty,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        textStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold)),
                    child: Text("LOGIN"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        print(username + password);
                        CustomDialog.loadingDialog(context);
                        final result =
                            await context.read<AuthProvider>().login();
                        if (result) {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, RouteConst.home);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
