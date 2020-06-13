import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_aula_1/app/page/home/home_controller.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextField(
            decoration: InputDecoration(labelText: 'Nome'),
            onChanged: (value){homeController.text = value;},
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: (){
          //Navigator.pushNamed(context, '/other/${homeController.text}');
          //Modular.to.pushNamed('/other/${homeController.text}');
          Modular.to.pushNamed('/other');
        },
      ),
    );
  }
}
