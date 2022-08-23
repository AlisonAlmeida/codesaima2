// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:codesaima2/models/user.dart';
import 'package:codesaima2/responsive/desktop_scaffold.dart';
import 'package:codesaima2/responsive/mobile_scaffold.dart';
import 'package:codesaima2/responsive/responsive_layout.dart';
import 'package:codesaima2/responsive/tablet_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopscaffold: DesktopScaffold(),
      mobilescaffold: MobileScaffold(),
      tabletscaffold: TabletScaffold(),
    );
  }
}
