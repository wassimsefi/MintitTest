import '../models/user.dart';

class UserViewModel {
  final User _user;

  UserViewModel({required User user}) : _user = user;

  String get firstName {
    return _user.firstName;
  }

  String get lastName {
    return _user.lastName;
  }
}
