import 'package:flutter/material.dart';

import '../models/user.dart';
import '../resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await AuthMethods().getUserDetail();
    _user = user;
    notifyListeners();
  }
}
