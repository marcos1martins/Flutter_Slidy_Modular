import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'start_controller.g.dart';

class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store implements Disposable {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }
}
