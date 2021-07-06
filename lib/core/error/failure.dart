import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String? message;

  Failure({this.message});

  @override
  List<dynamic> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message =>
      'Não foi possível processar seu pedido, tente novamente mais tarde.';
}

class NotFoundFailure extends Failure {
  @override
  String get message => 'Registro não encontrato.';
}

class PasswordWrongFailure extends Failure {
  @override
  String get message => 'Senha incorreta.';
}
