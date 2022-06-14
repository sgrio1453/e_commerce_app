import 'package:flutter/services.dart';

final String tableUser = 'userInfo';

class UserFields {
  static final List<String> values = [userName, email, uniqueId];

  static final String userName = 'userName';
  static final String email = 'email';
  static final String uniqueId = 'uniqueId';
}

class User {
  final String userName;
  final String email;
  final String uniqueId;

  const User(
      {required this.userName, required this.email, required this.uniqueId});

  static User fromJson(Map<String, Object?> json) => User(
      userName: json[UserFields.userName] as String,
      email: json[UserFields.email] as String,
      uniqueId: json[UserFields.uniqueId] as String);

  Map<String, Object?> toJson() => {
        UserFields.userName: userName,
        UserFields.email: email,
        UserFields.uniqueId: uniqueId
      };

  User copy({
    String? userName,
    String? email,
    String? uniqueId,
  }) =>
      User(
          userName: userName ?? this.userName,
          email: email ?? this.email,
          uniqueId: uniqueId ?? this.uniqueId);
}
