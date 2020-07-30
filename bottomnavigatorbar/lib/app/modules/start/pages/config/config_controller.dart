import 'package:mobx/mobx.dart';

part 'config_controller.g.dart';

class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
