// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/generate_pdf.dart';
import 'package:codesaima2/core/generate_table_sheet.dart';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:codesaima2/screens/plantao_social/acompanhamento_plantao_social_screen.dart';
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
  late Stream<List<PlantaoSocial>> stream;

  @override
  void initState() {
    stream = objectBox.getAllPlantaoSocialStream();
    super.initState();
  }

  _createPdfButtonPressed() async {
    showGeneralLoading(context);
    await Future.delayed(Duration(seconds: 1));
    GeneratePDFAcompanhamentoSocial(list: objectBox.getAllPlantaoSocialList())
        .generateDocument();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  _createSheetButtonPressed() async {
    showGeneralLoading(context);
    await Future.delayed(Duration(seconds: 1));
    GenerateTableSheet(list: objectBox.getAllPlantaoSocialList())
        .exportAllRegisters();

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Plantão Social'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              icon: Icon(Icons.text_snippet_outlined),
              onPressed: () async => _createSheetButtonPressed(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              onPressed: () async => _createPdfButtonPressed(),
              icon: Icon(Icons.picture_as_pdf),
            ),
          )
        ],
      ),
      body: StreamBuilder<List<PlantaoSocial>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PlantaoSocial> list = snapshot.data!.reversed.toList();
            if (list.isEmpty) {
              return Center(
                child: Text('Nenhum registro encontrado'),
              );
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final PlantaoSocial plantaoSocial = list[index];
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AcompanhamentoPlantaoSocialScreen(
                                    id: plantaoSocial.id),
                          )),
                      title: Text(plantaoSocial.name),
                      subtitle: Text('Tel: ${plantaoSocial.phoneNumber}'),
                    ),
                  );
                },
              );
            }
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>
              Navigator.pushNamed(context, '/plantao_social_morar_melhor')),
    );
  }
}
