import 'package:codesaima2/responsive/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobilescaffold;
  final Widget tabletscaffold;
  final Widget desktopscaffold;
  const ResponsiveLayout({Key? key, required this.mobilescaffold, required  this.desktopscaffold, required this.tabletscaffold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < kMobileWidth) {
          return mobilescaffold;
        } else if (constraints.maxWidth < kTabletWidth) {
          return tabletscaffold;
        } else {
          return desktopscaffold;
        }
      },
    );
  }
}