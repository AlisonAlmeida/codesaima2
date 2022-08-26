import 'dart:io';

import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GenerateTableSheet {
  GenerateTableSheet({required this.list});
  final List<PlantaoSocial> list;

  exportAllRegisters() async {
    final DateTime now = DateTime.now();
    final String dateFormattedForFile =
        DateFormat('yyyy-MM-dd-hh-mm').format(now);
    var excel = Excel.createExcel();
    var sheet = excel[excel.getDefaultSheet()!];

    for (var i = 0; i < list.length; i++) {
      int columnIndex = 0;
      PlantaoSocial plantaoSocial = list[i];
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.name;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.phoneNumber;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.address;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.propertyOwner;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.timeLiveState;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.howManyFamilies;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.howManyPeopleLive;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.socialProfile;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.kindImprovemente;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.constructionStatus;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.satisfactionState;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.observations;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.responsibleCompany;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.visitor;
      columnIndex++;
      sheet
          .cell(
              CellIndex.indexByColumnRow(rowIndex: i, columnIndex: columnIndex))
          .value = plantaoSocial.socialWorker;
      columnIndex++;
    }
    final bytes =
        excel.save(fileName: 'CadastrosCompilados-$dateFormattedForFile.xlsx');

    Directory? directory;
    if (Platform.isWindows) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getApplicationSupportDirectory();
    }
    final file = File(
        '${directory!.path}/CadastrosCompilados-$dateFormattedForFile.xlsx');
    await file.writeAsBytes(bytes!);
    
      Platform.isWindows
        ? launchUrlString(
            '${directory.path}/CadastrosCompilados-$dateFormattedForFile.xlsx')
        : Share.shareFiles([
            '${directory.path}/CadastrosCompilados-$dateFormattedForFile.xlsx'
          ], mimeTypes: [
            'application/xlsx'
          ]);
     
  }
}
