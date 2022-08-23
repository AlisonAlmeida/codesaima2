import 'package:codesaima2/responsive/appbar.dart';
import 'package:codesaima2/responsive/drawer.dart';
import 'package:flutter/material.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar,
      drawer: CustomDrawer(),
    );
  }
}
