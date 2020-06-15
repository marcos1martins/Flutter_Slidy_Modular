import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Observer(builder: (BuildContext context) {
        if (homeController.pokemons.error != null) {
          return Center(
            child: FlatButton(
              onPressed: () {
                homeController.fetchPokemons();
              },
              child: Text('recarregar'),
            ),
          );
        }
        if (homeController.pokemons.value == null) {
          return Center(child: CircularProgressIndicator());
        }
        var list = homeController.pokemons.value;

        return ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
          );
        });
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Modular.to.pushNamed('');
        },
      ),
    );
  }
}
