import 'package:clean_arch_experts/features/auth/data/models/user_model.dart';

import 'do_login_data_source.dart';

class DoLoginDataSourceFirebase implements DoLoginDataSource {
  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    throw UnimplementedError();
  }
}
