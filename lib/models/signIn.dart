import 'dart:core';

class SignIn {
  final String email;
  final String password;

  SignIn({
    required this.email,
    required this.password,
  });
  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
