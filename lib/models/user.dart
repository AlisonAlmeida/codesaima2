import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String name;
  String cpf;
  String email;
  String password;

  User({this.cpf = '', this.email = '', this.password = '', this.name = ''});

  static fromjson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      cpf: json['cpf'],
      email: json['email'],
      password: json['password'],
    );
  }

  setUser(User user) {
    name = user.name;
    cpf = user.cpf;
    email = user.email;
    password = user.password;
    notifyListeners();
  }

  @override
  String toString() {
    return 'User{name: $name, cpf: $cpf, email: $email, password: $password}';
  }
}
