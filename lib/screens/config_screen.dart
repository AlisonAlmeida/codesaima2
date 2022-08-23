// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Configurações'),
      ),
    );
  }
}
