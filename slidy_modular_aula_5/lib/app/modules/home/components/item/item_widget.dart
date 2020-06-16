import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';

class ItemWidget extends StatelessWidget {
  final HomeController controller = Modular.get();
  final int index;

  ItemWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(controller.list[index]),
      trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            controller.revome(index);
          }),
    );
  }
}
