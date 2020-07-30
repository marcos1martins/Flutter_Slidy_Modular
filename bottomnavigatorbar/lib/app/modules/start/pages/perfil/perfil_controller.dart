import 'package:mobx/mobx.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
