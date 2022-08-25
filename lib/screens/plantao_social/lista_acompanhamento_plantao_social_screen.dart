// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/generate_pdf.dart';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:flutter/material.dart';
import 'package:codesaima2/main.dart';

class ListAcompanhamentoPlantaoSocialMorarMelhor extends StatefulWidget {
  const ListAcompanhamentoPlantaoSocialMorarMelhor({Key? key})
      : super(key: key);

  @override
  State<ListAcompanhamentoPlantaoSocialMorarMelhor> createState() =>
      _ListAcompanhamentoPlantaoSocialMorarMelhorState();
}

class _ListAcompanhamentoPlantaoSocialMorarMelhorState
    extends State<ListAcompanhamentoPlantaoSocialMorarMelhor> {
  _createPdf(int plantaoSocialIndex) async {
    showGeneralLoading(context);
    await Future.delayed(Duration(seconds: 1));
    GeneratePDFAcompanhamentoSocial(acompanhamentoSocialId: plantaoSocialIndex)
        .generateDocument();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<PlantaoSocial> list = objectBox.getAllPlantaoSocial();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Plantão Social'),
        ),
        body: list.isNotEmpty
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  PlantaoSocial plantaoSocial = list[index];
                  return Card(
                    child: ListTile(
                      title: Text(plantaoSocial.name),
                      subtitle: Text(plantaoSocial.phoneNumber),
                      trailing: Wrap(
                        spacing: 8.0, // gap between two icons
                        runSpacing: 4.0, // gap between two icons
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  '/plantaoSocial/edit/${plantaoSocial.id}');
                            },
                          ),
                          IconButton(
                            icon: Icon(Platform.isWindows
                                ? Icons.picture_as_pdf
                                : Icons.print),
                            onPressed: () {
                              _createPdf(plantaoSocial.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'Lista Vazia',
                  style: TextStyle(fontSize: 50),
                ),
              ));
  }
}
