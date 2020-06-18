import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_slidy/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) => user = value;

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }
  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }
}
