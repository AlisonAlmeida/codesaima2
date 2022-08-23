// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:codesaima2/responsive/desktop_scaffold.dart';
import 'package:codesaima2/responsive/mobile_scaffold.dart';
import 'package:codesaima2/responsive/programs_view.dart';
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
    Size _size = MediaQuery.of(context).size;
    print(_size);
    return ResponsiveLayout(
      desktopscaffold: Row(
        children: [
          Expanded(
            child: DesktopScaffold(),
          ),
        ],
      ),
      mobilescaffold: MobileScaffold(),
      tabletscaffold: TabletScaffold(),
    );
  }
}
