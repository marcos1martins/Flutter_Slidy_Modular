import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slidy_modular_testes/app/app_module.dart';
import 'package:slidy_modular_testes/app/modules/home/home_controller.dart';
import 'package:slidy_modular_testes/app/modules/home/home_module.dart';
import 'package:slidy_modular_testes/app/shared/repositories/localstorage/local_storage_interface.dart';

import 'local_storage_mock.dart';

main() {
  initModule(
    AppModule(),
    changeBinds: [
      Bind<ILocalStorage>((i) => LocalStorageMock()),
    ],
  );
  initModule(HomeModule());
  test('click save', () async {
    final HomeController controller = Modular.get();
    controller.setText('marcos');
    controller.save();
    expect(controller.list.length, 1);
    expect(controller.list[0], 'marcos');

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect(listStorage[0], 'marcos');
  });

  test('click remove', () async {
    final HomeController controller = Modular.get();
    controller.setText('marcos');
    controller.save();

    controller.revome(0);
    expect(controller.list.length, 0);

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect(controller.list.length, 0);
    expect(listStorage.isEmpty, true);
  });
}
