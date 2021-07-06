import 'dart:convert';

import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String name,
      required DateTime bornDate,
      required String pictureUrl,
      required String email})
      : super(
            name: name,
            bornDate: bornDate,
            pictureUrl: pictureUrl,
            email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.toIso8601String(),
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
      name: map['comple_name'],
      bornDate: DateTime.parse(map['born_date']),
      pictureUrl: map['photo'],
      email: map['email'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        bornDate,
        pictureUrl,
        email,
      ];

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
