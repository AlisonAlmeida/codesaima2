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
  final int acompanhamentoSocialId;

  GeneratePDFAcompanhamentoSocial({required this.acompanhamentoSocialId});

  Future<File> generateDocument() async {
    PlantaoSocial? plantaoSocial =
        objectBox.getPlantaoSocial(acompanhamentoSocialId);
    final DateTime now = DateTime.now();
    var dateFormattedForDocument = DateFormat('yyyy-MM-dd-hh-mm');
    Address address = Address();
    var v = address.toJson();
    print(plantaoSocial!.address);
    print(v);

    final pdf = Document();
    final imageCodesaima =
        (await rootBundle.load(kPathMainLogoCodesaima)).buffer.asUint8List();

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
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'ACOMPANHAMENTO DO PLANTÃO SOCIAL',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: 1,
                  child: Wrap(children: [
                    Text('NOME: ${plantaoSocial.name}'),
                    Text(
                        'ENDEREÇO: ${address.logradouro}, ${address.numero}, ${address.bairro}, ${address.localidade} - ${address.uf}'),
                  ])),
            ])
          ])
        ];
      },
      footer: (context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('___________________'),
                Text('Rubrica do Cadastrado'),
              ]),
            ]);
      },
    ));
    return saveDocument(
        name: '${plantaoSocial.name}-${dateFormattedForDocument.format(now)}',
        pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    Directory? directory;
    if (Platform.isWindows) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getApplicationSupportDirectory();
    }

    final bytes = await pdf.save();
    final file = File('${directory!.path}/$name.pdf');
    await file.writeAsBytes(bytes);

    Platform.isWindows
        ? launchUrlString(directory.path)
        : Share.shareFiles(['${directory.path}/$name.pdf'],
            mimeTypes: ['application/pdf']);
    return file;
  }
}
