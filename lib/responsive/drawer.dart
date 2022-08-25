// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
                radius: 30,
              ),
              Container(
                  width: ResponsiveLayout.isDesktop(context) ? 200 : 100,
                  height: ResponsiveLayout.isDesktop(context) ? 100 : 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(kPathMainLogoCodesaima)))),
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
              onTap: () => Navigator.popAndPushNamed(context, '/report')),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () => Navigator.pushNamed(context, '/config')),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deslogar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
