// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/colors.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/models/user.dart';
import 'package:codesaima2/screens/acompanhamento_plantao_social_screen.dart';
import 'package:codesaima2/screens/config_screen.dart';
import 'package:codesaima2/screens/home_page.dart';
import 'package:codesaima2/screens/login_screen.dart';
import 'package:codesaima2/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

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
      child: MaterialApp(
        title: kAppName,
        theme: ThemeData(
          primarySwatch: red,
        ),
        home: HomePage(),
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
    );
  }
}
