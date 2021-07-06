import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final DateTime bornDate;
  final String pictureUrl;
  final String email;

  User(
      {required this.name,
      required this.bornDate,
      required this.pictureUrl,
      required this.email});

  @override
  List<Object?> get props => [
        name,
        bornDate,
        pictureUrl,
        email,
      ];
}
