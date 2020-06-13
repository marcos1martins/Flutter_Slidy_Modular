import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'repositories/poke_repository.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => PokeRepository(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];
}
