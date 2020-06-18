import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_modular_tela_login/app/modules/login/login_module.dart';
import 'package:slidy_modular_tela_login/app/shared/auth/auth_controller.dart';
import 'package:slidy_modular_tela_login/app/shared/auth/repositories/auth_repository.dart';
import 'package:slidy_modular_tela_login/app/shared/auth/repositories/auth_repository_interface.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'shared/repositories/localstorage/local_storage_share.dart';
import 'shared/repositories/localstorage/local_storage_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShare()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
