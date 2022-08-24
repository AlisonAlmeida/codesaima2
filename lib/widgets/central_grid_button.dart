import 'package:codesaima2/core/colors.dart';
import 'package:flutter/material.dart';

class CentralGridButton extends StatelessWidget {
  const CentralGridButton(
      {Key? key, required this.callback, required this.pathImage})
      : super(key: key);
  final VoidCallback callback;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
            color: white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 150,
          height: 150,
          child: Image.asset(pathImage)),
    );
  }
}
