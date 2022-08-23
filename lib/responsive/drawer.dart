// ignore_for_file: prefer_const_constructors

import 'package:codesaima2/core/const.dart';
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: ResponsiveLayout.isDesktop(context) ? 300 : 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ResponsiveLayout.isDesktop(context)
                        ? kPathMainLogoCodesaima
                        : kPathDrawerLogoCodesaima))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Consumer<User>(
                builder: (context, user, child) =>
                    Text(user.name == '' ? 'Usuário não logado' : user.name)),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.popAndPushNamed(context, '/home')),
          ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Relatórios'),
              onTap: () => Navigator.popAndPushNamed(context, '/report')),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () => Navigator.pushNamed(context, '/config')),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deslogar'),
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
