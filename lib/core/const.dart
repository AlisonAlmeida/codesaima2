import 'package:codesaima2/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kPathMainLogoCodesaima = 'lib/assets/images/logo_codesaima.png';
const kPathMainLogoCodesaimaWhite =
    'lib/assets/images/logo_codesaima_white.png';
const kPathDrawerLogoCodesaima =
    'lib/assets/images/logo_codesaima_drawer_header.png';
const kPathAquiTemDono = 'lib/assets/images/logo_aqui_tem_dono.png';
const kPathMorarMelhor = 'lib/assets/images/logo_morar_melhor.png';
const kAppName = 'Codesaima';

List<String> socialProfileList = [
  'PCD',
  'Idoso',
  'Mãe chefe de família',
  'Outros'
];
List<String> constructionStatusList = [
  'Iniciada',
  'Não iniciada',
  'Concluída',
];
List<String> satisfactionLevelList = ['Ótimo', 'Bom', 'Regular', 'Péssimo'];

showGeneralMessageDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context))
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
      builder: (context) => Container(
          width: 50, height: 50, color: Colors.white70, child: spinkit));
}
