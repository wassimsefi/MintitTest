import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  late final String firstName;
  late final String lastName;

  User({
    required this.firstName,
    required this.lastName,
  });

  void updatefirstName(String index) {
    firstName = index;
    notifyListeners();
  }

  void updatelastName(String index) {
    lastName = index;
    notifyListeners();
  }
}
