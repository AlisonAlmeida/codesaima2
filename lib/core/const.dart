import 'package:codesaima2/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kPathMainLogoCodesaima = 'lib/assets/images/logo_codesaima.png';

showGeneralMessageDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

showGeneralLoading(BuildContext context) {
  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: index.isEven ? red : black,
        ),
      );
    },
  );
  showDialog(
      context: context,
      builder: (context) =>
          Container(width: 50, height: 50, color: white, child: spinkit));
}
