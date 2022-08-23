// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AcompanhamentoPlantaoSocialScreen extends StatefulWidget {
  const AcompanhamentoPlantaoSocialScreen({Key? key}) : super(key: key);

  @override
  State<AcompanhamentoPlantaoSocialScreen> createState() =>
      _AcompanhamentoPlantaoSocialScreenState();
}

class _AcompanhamentoPlantaoSocialScreenState
    extends State<AcompanhamentoPlantaoSocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantão Social'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Acompanhamento Plantão Social'),
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Nome', border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
