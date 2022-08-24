// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/colors.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/credentials.dart';
import 'package:codesaima2/core/misc.dart';
import 'package:codesaima2/core/theme_provider.dart';
import 'package:codesaima2/models/user.dart';
import 'package:codesaima2/responsive/responsive_layout.dart';
import 'package:codesaima2/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GSheets gSheets;
  late Worksheet? sheet;
  late final Spreadsheet ss;
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    initDb();
    super.initState();
  }

  initDb() async {
    // init Gsheets
    gSheets = GSheets(credential);
    //fethc sheet
    ss = await gSheets.spreadsheet(spreadsheetId);
    //get worksheet
    sheet = ss.worksheetByTitle('usuarios');
  }

  tryLogin() async {
    showGeneralLoading(context);
    bool userFinded = false;
    try {
      var users = await sheet!.values.map.allRows();
      for (var userFromSheet in users!) {
        User user = User.fromjson(userFromSheet);
        if (user.cpf == cpfController.text &&
            user.password == passwordController.text) {
          if (mounted) {
            Provider.of<User>(context, listen: false).setUser(user);
          }

          userFinded = true;
          break;
        }
      }
      if (mounted) {
        Navigator.pop(context);
        userFinded
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()))
            : showGeneralMessageDialog(context, 'Usuário ou senha inválidos');
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        showGeneralMessageDialog(context, e.toString());
      }
    }
  }

  @override
  void dispose() {
    cpfController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () => value.changeTheme(value.getThemeMode),
                icon: Icon(
                    value.getThemeMode ? iconAppThemeDark : iconAppThemeLight)),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 50.0, bottom: 50.0),
              child: SizedBox(
                  width: ResponsiveLayout.isMobile(context) ? 500 : 800,
                  child: Center(
                      child: Consumer<ThemeProvider>(
                    builder: (context, value, child) => Image.asset(
                        value.getThemeMode
                            ? kPathMainLogoCodesaimaWhite
                            : kPathMainLogoCodesaima),
                  ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                cursorColor: Colors.black,
                controller: cpfController,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hintText: 'CPF',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 40),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2)),
                    border: OutlineInputBorder(),
                  ),
                  onEditingComplete: () => tryLogin()),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () => tryLogin(),
                child: Text(
                  'Acessar',
                  style: TextStyle(color: white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
