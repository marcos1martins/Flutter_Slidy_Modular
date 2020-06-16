import 'package:slidy_modular_aula_5/app/shared/repositories/localstorage/local_storage_hive.dart';
import 'package:slidy_modular_aula_5/app/shared/repositories/localstorage/local_storage_share.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:slidy_modular_aula_5/app/app_widget.dart';
import 'package:slidy_modular_aula_5/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //Bind((i) => LocalStorageHive()),
        Bind((i) => LocalStorageShare()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
