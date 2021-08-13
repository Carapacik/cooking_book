import 'package:flutter/material.dart';
import 'package:recipebook/model/user_detail.dart';

class AuthNotifier extends ChangeNotifier {
  UserDetail? _userDetail;

  UserDetail? get userDetail => _userDetail;

  setUser(UserDetail? userDetail) {
    if (userDetail != null) {
      _userDetail = userDetail;
    }
    notifyListeners();
  }
}
