import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class DoLoginRepository {
  DoLoginRepository(DoLoginDataSourceApi doLoginDataSourceApi);

  Future<Either<Failure, User>> doLogin(
      {required String email, required String password});
}
