// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:codesaima2/core/misc.dart';
import 'package:codesaima2/core/theme_provider.dart';
import 'package:codesaima2/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationsScreen extends StatefulWidget {
  const ConfigurationsScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationsScreen> createState() => _ConfigurationsScreenState();
}

class _ConfigurationsScreenState extends State<ConfigurationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Modo escuro:'),
                Consumer<ThemeProvider>(
                    builder: (context, value, child) => Switch(
                        value: value.getThemeMode,
                        onChanged: (v) {
                          value.changeTheme(v);
                          value.getThemeMode
                              ? iconAppThemeDark
                              : iconAppThemeLight;
                        }))
              ],
            ),
            Row(
              children: [
                Text('Deletar todos os cadastros:'),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () =>
                      objectBox.removeAllPlantaoSocial()
                    ,
                    child: Text('Deletar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
