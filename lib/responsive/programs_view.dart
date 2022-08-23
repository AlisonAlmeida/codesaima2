// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProgramasView extends StatelessWidget {
  const ProgramasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/plantao_social_morar_melhor'),
            child: Text('Morar Melhor')),
        ElevatedButton(onPressed: () {}, child: Text('Aqui tem Dono'))
      ],
    );
  }
}
