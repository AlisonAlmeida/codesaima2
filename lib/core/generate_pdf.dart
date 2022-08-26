// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/main.dart';
import 'package:codesaima2/models/address.dart';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GeneratePDFAcompanhamentoSocial {
  GeneratePDFAcompanhamentoSocial({required this.list});
  final List<PlantaoSocial> list;

  Future generateDocument() async {
    final DateTime now = DateTime.now();
    var dateFormattedForDocument = DateFormat('yyyy-MM-dd-hh-mm').format(now);

    final pdf = Document();
    final imageCodesaima =
        (await rootBundle.load(kPathMainLogoCodesaima)).buffer.asUint8List();

    for (var i = 0; i < list.length; i++) {
      PlantaoSocial plantaoSocial = list[i];
      Address address = Address();
      address = addressFromJson(plantaoSocial.address);
      pdf.addPage(MultiPage(
        header: (context) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(MemoryImage(imageCodesaima)))
            ]),
          ]);
        },
        build: (context) {
          return [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'ACOMPANHAMENTO DO PLANTÃO SOCIAL',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'NOME: ',
                          ),
                          TextSpan(
                            text: plantaoSocial.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'TELEFONE: ',
                          ),
                          TextSpan(
                            text: plantaoSocial.phoneNumber,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'ENDEREÇO: ',
                          ),
                          TextSpan(
                            text:
                                '${address.logradouro}, ${address.numero}, ${address.bairro}, ${address.localidade} - ${address.uf}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'PROPRIETÁRIO DO IMÓVEL: ',
                          ),
                          TextSpan(
                            text: plantaoSocial.propertyOwner,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'QUANTO TEMPO RESIDEM NO ESTADO: ',
                          ),
                          TextSpan(
                            text: plantaoSocial.timeLiveState,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '1) Perfil social do Benefício: ',
                              ),
                              TextSpan(
                                text: plantaoSocial.socialProfile,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    '2) Que tipo de melhoria foi contemplada no seu imóvel: ',
                              ),
                              TextSpan(
                                text: plantaoSocial.kindImprovemente,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '3) Andamento da obra: ',
                              ),
                              TextSpan(
                                text: plantaoSocial.constructionStatus,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    '4) Grau de satisfação com os serviços que estão sendo ou já foram realizados: ',
                              ),
                              TextSpan(
                                text: plantaoSocial.satisfactionState,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    '5) Considerações do acompanhamento social (Vulnerabilidades, Citações sobre o serviço e outros): ',
                              ),
                              TextSpan(
                                text: plantaoSocial.observations,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '6) Empresa responsável pela execução: ',
                              ),
                              TextSpan(
                                text: plantaoSocial.responsibleCompany,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ])
                    ]),
              ),
            ])
          ];
        },
        footer: (context) {
          var dateFormattedForDocument =
              DateFormat('dd/MM/yyyy').format(DateTime.now().toLocal());
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'DATA: ',
                        ),
                        TextSpan(
                          text: dateFormattedForDocument,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'VISITADOR: ',
                        ),
                        TextSpan(
                          text: plantaoSocial.visitor,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'ASSISTENTE SOCIAL RESPONSÁVEL: ',
                        ),
                        TextSpan(
                          text: plantaoSocial.socialWorker,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      'Companhia de Desenvolvimento de Roraima',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      'Av. Mário Homem de Melo, Nº 1489, Mecejana'),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      'Boa Vista | Roraima | Brasil | CEP 69.306-350'),
                                ]),
                          ]),
                      Column(children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image(
                            MemoryImage(imageCodesaima),
                          ),
                        ),
                      ])
                    ])
              ]);
        },
      ));
    }

    Directory? directory;
    if (Platform.isWindows) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getApplicationSupportDirectory();
    }
    final bytes = await pdf.save();
    final file = File(
        '${directory!.path}/CadastrosCompilados-$dateFormattedForDocument.pdf');
    await file.writeAsBytes(bytes);

    Platform.isWindows
        ? launchUrlString(
            '${directory.path}/CadastrosCompilados-$dateFormattedForDocument.pdf')
        : Share.shareFiles([
            '${directory.path}/CadastrosCompilados-$dateFormattedForDocument.pdf'
          ], mimeTypes: [
            'application/pdf'
          ]);
  }
}
