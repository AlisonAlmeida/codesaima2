// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/widgets/central_grid_button.dart';
import 'package:flutter/material.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CentralGridButton(
              callback: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Center(
                            child: ListView(
                          children: [
                            Text(
                              'Morar Melhor',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                trailing: Icon(Icons.home_work),
                                title: Text('Cadastro Plantão Social'),
                                onTap: () => Navigator.pushNamed(
                                    context, '/plantao_social_morar_melhor'),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () => Navigator.pushNamed(context,
                                    '/list_plantao_social_morar_melhor'),
                                trailing: Icon(Icons.list),
                                title:
                                    Text('Listas Cadastros do Plantão Social'),
                              ),
                            ),
                          ],
                        )),
                      );
                    },
                  ),
              pathImage: kPathMorarMelhor),
          VerticalDivider(),
          CentralGridButton(callback: () {}, pathImage: kPathAquiTemDono),
        ],
      ),
    );
  }
}
