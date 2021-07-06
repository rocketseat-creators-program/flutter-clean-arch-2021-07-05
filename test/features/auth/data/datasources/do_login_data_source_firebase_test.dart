import 'package:clean_arch_experts/features/auth/data/datasources/do_login_data_source_firebase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dataSource = DoLoginDataSourceFirebase();

  test('Should get error when try do login with api', () async {
    expect(
        () async =>
            await dataSource.doLogin(email: 'email@email.com', password: '123'),
        throwsA(isA<UnimplementedError>()));
  });
}
