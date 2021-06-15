import 'package:admin2/core/provider/main_provider.dart';
import 'package:admin2/core/settings/responsive.dart';
import 'package:admin2/core/widget/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final Widget header;
  final Widget body;
  const MainScreen({Key key, this.header, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider<MainProvider>(
      create: (context) => MainProvider(),
      child: Builder(
        builder: (context) => Scaffold(
          key: context.read<MainProvider>().scaffoldKey,
          drawer: SideMenu(),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: Responsive.isDesktop(context)
                        ? EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                        : EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        header,
                        Divider(),
                        Expanded(
                            child: SingleChildScrollView(
                          child: body,
                        )),
                      ],
                    ),
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
