import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';
import 'package:clean_arch_experts/features/auth/domain/usecases/do_login.dart';

class LoginController {
  final DoLogin _doLogin;

  LoginController(this._doLogin);

  Future<User> doLogin(
      {required String email, required String password}) async {
    var response = await _doLogin(DoLoginParams(
      email: email,
      password: password,
    ));

    var result = response.fold((l) => l, (r) => r);

    if (result is User) {
      return result;
    } else {
      throw result;
    }
  }
}
