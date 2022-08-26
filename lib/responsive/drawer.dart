// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/core/theme_provider.dart';
import 'package:codesaima2/models/user.dart';
import 'package:codesaima2/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /**
               * CircleAvatar(
                child: Icon(Icons.person),
                radius: 30,
              ),
               */
              Consumer<ThemeProvider>(
                builder: (context, value, child) => Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(value.isAppThemeDark
                                ? kPathMainLogoCodesaimaWhite
                                : kPathMainLogoCodesaima)))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Consumer<User>(
                builder: (context, user, child) => Text(
                      user.name == '' ? 'Usuário não identificado' : user.name,
                      style: TextStyle(fontSize: 30),
                    )),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.popAndPushNamed(context, '/home')),
          ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Relatórios'),
              onTap: () => Navigator.pushNamed(context, '/report')),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () => Navigator.pushNamed(context, '/config')),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deslogar'),
              onTap: () {
                Navigator.pop(context);
                ResponsiveLayout.isDesktop(context)
                    ? Navigator.pop(context)
                    : null;
              }),
        ],
      ),
    );
  }
}
