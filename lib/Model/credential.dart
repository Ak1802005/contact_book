import 'dart:convert';

class Credential {
  int? id;
  String name;
  String email;
  String username;
  String password;

  Credential(
      {required this.name,
      required this.email,
      required this.username,
      required this.password,
      this.id});

  factory Credential.fromJson(Map json) {
    return Credential(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'unknown',
      email: json['email'] ?? 'unknown',
      username: json['username'] ?? 'unknown',
      password: json['password'] ?? 'unknown',
    );
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}

