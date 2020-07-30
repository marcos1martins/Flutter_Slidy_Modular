import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'config_controller.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key key, this.title = "Config"}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends ModularState<ConfigPage, ConfigController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
