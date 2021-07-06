import 'package:clean_arch_experts/features/auth/data/datasources/do_login_data_source.dart';
import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';
import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/domain/repositories/do_login_repository.dart';
import 'package:dartz/dartz.dart';

class DoLoginRepositoryImpl implements DoLoginRepository {
  final DoLoginDataSource _dataSource;

  DoLoginRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password}) async {
    try {
      var result = await _dataSource.doLogin(email: email, password: password);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
