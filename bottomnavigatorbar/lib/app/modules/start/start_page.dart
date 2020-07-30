import 'package:bottomnavigatorbar/app/modules/start/pages/config/config_page.dart';
import 'package:bottomnavigatorbar/app/modules/start/pages/perfil/perfil_page.dart';
import 'package:bottomnavigatorbar/app/modules/start/submodules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: <Widget>[
          RouterOutlet(module: HomeModule()),
          ConfigPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
                currentIndex: controller.pageViewController?.page?.round() ?? 0,
                onTap: (index) =>
                    controller.pageViewController.jumpToPage(index),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('Config'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    title: Text('Perfil'),
                  ),
                ]);
          }),
    );
  }
}
