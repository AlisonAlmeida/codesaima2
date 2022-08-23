// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:codesaima2/responsive/appbar.dart';
import 'package:codesaima2/responsive/drawer.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar,
        drawer: CustomDrawer());
  }
}
