import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void sideMenuControl() {
    if (!_scaffoldKey.currentState.isDrawerOpen)
      _scaffoldKey.currentState.openDrawer();
  }
}
