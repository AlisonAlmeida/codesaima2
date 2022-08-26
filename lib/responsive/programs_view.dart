// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/colors.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/theme_provider.dart';
import 'package:codesaima2/widgets/central_grid_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: CentralGridButton(
                callback: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0))),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Consumer<ThemeProvider>(
                          builder: (context, value, child) => Container(
                            decoration: BoxDecoration(
                              color: value.isAppThemeDark
                                  ? Color.fromARGB(255, 41, 39, 39)
                                  : white,
                              border: Border.fromBorderSide(BorderSide(
                                  width: 2,
                                  color: value.isAppThemeDark
                                      ? Colors.white
                                      : Colors.black)),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 5,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(color: Colors.grey),
                                ),
                                Text(
                                  'Morar Melhor',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    trailing: Icon(Icons.home_work),
                                    title:
                                        Text('Acompanhamento Plantão Social'),
                                    onTap: () => Navigator.pushNamed(context,
                                        '/list_plantao_social_morar_melhor'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                pathImage: kPathMorarMelhor),
          ),
          VerticalDivider(),
          Flexible(
              child: CentralGridButton(
                  callback: () {}, pathImage: kPathAquiTemDono)),
        ],
      ),
    );
  }
}
