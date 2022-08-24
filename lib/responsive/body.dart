// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:codesaima2/responsive/programs_view.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  CustomBody({Key? key}) : super(key: key);
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Programas'),
        ProgramsView(),
      ],
    );
  }
}
