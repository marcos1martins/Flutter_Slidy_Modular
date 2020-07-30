import 'package:bottomnavigatorbar/app/modules/start/pages/perfil/perfil_page.dart';

import 'pages/config/config_controller.dart';
import 'pages/perfil/perfil_controller.dart';
import 'start_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'start_page.dart';

class StartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigController()),
        Bind((i) => PerfilController()),
        Bind((i) => StartController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => StartPage()),
        Router('/perfil', child: (_, args) => PerfilPage()),
      ];

  static Inject get to => Inject<StartModule>.of();
}
