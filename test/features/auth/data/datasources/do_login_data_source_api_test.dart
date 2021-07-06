import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:clean_arch_experts/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  var dio = DioMock();
  var dataSource = DoLoginDataSourceApi(dio);
  test('Should do login on API', () async {
    when(() => dio.post(any(),
        data: {"email": 'email@email.com', "password": '123'})).thenAnswer(
      (invocation) => Future.value(
        Response(requestOptions: RequestOptions(path: ''), data: tkUserApi),
      ),
    );

    UserModel user =
        await dataSource.doLogin(email: 'email@email.com', password: '123');

    expect(user.toMap(), tkUserApi);

    verify(() => dio.post(any(),
        data: {"email": 'email@email.com', "password": '123'})).called(1);
    verifyNoMoreInteractions(dio);
  });

  test('Should get error when try do login with api', () async {
    when(() => dio.post(any(),
        data: {"email": 'email@email.com', "password": '123'})).thenThrow(
      ServerFailure(),
    );

    expect(
        () async =>
            await dataSource.doLogin(email: 'email@email.com', password: '123'),
        throwsA(isA<ServerFailure>()));

    verify(() => dio.post(any(),
        data: {"email": 'email@email.com', "password": '123'})).called(1);
    verifyNoMoreInteractions(dio);
  });
}

var tkUserApi = {
  "name": "Nome",
  "bornDate": DateTime(2021, 6, 1).toIso8601String(),
  "pictureUrl": "https://test.com/photo.png",
  "email": "email@email.com"
};
