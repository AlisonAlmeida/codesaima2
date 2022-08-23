import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobilescaffold;
  final Widget tabletscaffold;
  final Widget desktopscaffold;
  const ResponsiveLayout(
      {Key? key,
      required this.mobilescaffold,
      required this.desktopscaffold,
      required this.tabletscaffold})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          print('mobile');
          return mobilescaffold;
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1000) {
          print('tablet');
          return tabletscaffold;
        } else {
          print('desktop');
          return desktopscaffold;
        }
      },
    );
  }
}
