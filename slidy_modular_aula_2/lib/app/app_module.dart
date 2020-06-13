import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'page/home/home_controller.dart';
import 'page/home/home_page.dart';
import 'shared/repositories/poke_repository.dart';
import 'shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind((i) => HomeController(i.get())),
    Bind((i) => PokeRepository(i.get())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];


  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => HomePage()),
  ];
  
  @override
  Widget get bootstrap => AppWidget();
}