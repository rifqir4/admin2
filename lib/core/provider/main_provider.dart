import 'package:flutter/material.dart';

class MainProvider {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void sideMenuControl() {
    if (!_scaffoldKey.currentState.isDrawerOpen)
      _scaffoldKey.currentState.openDrawer();
  }
}
