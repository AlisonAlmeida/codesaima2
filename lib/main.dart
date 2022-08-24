// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/colors.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/theme_provider.dart';
import 'package:codesaima2/models/user.dart';
import 'package:codesaima2/screens/acompanhamento_plantao_social_screen.dart';
import 'package:codesaima2/screens/config_screen.dart';
import 'package:codesaima2/screens/home_page.dart';
import 'package:codesaima2/screens/login_screen.dart';
import 'package:codesaima2/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider(), child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => MaterialApp(
          title: kAppName,
          darkTheme: ThemeData.dark(),
          themeMode: provider.getThemeMode ? ThemeMode.dark : ThemeMode.light,
          theme: provider.getThemeMode
              ? ThemeData.dark()
              : ThemeData.light().copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.teal)), //Color(0xFFE0020C)
          home: LoginPage(),
          debugShowCheckedModeBanner: false,
          routes: {
            '/home': (context) => HomePage(),
            '/report': (context) => ReportScreen(),
            '/plantao_social_morar_melhor': (context) =>
                AcompanhamentoPlantaoSocialScreen(),
            '/config': (context) => ConfigurationsScreen(),
            '/login': (context) => LoginPage(),
          },
        ),
      ),
    );
  }
}
