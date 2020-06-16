import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/item/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: controller.setText,
          ),
          actions: <Widget>[
            Observer(
              builder: (_) {
                return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: controller.text.isEmpty ? null : controller.save,
                );
              },
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (_, int index) {
                if (controller.list.length == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListTile(
                    title: Text(controller.list[index]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        controller.revome(index);
                      },
                    ),
                  );
                }
              },
            );
          },
        ));
  }
}
