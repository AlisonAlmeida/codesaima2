import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  UserData(
      {this.name = '', this.email = '', this.password = '', this.cpf = ''});
  String name;
  String cpf;
  String password;
  String email;
}
