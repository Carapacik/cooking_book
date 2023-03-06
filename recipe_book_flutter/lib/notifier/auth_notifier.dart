import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:recipe_book_flutter/model/user_model.dart';
import 'package:recipe_book_flutter/service/api_service.dart';

class AuthNotifier extends ChangeNotifier {
  UserModel? _userDetail;
  final ApiService _apiService = ApiService();

  UserModel? get userDetail => _userDetail;

  set userDetail(UserModel? userDetail) {
    _userDetail = userDetail;
    notifyListeners();
  }

  bool get isAuth => _userDetail != null;

  Future<void> getCurrentUser() async {
    try {
      final response = await _apiService.getRequest('user/current-user');
      if (response.statusCode == 200) {
        final user = UserModel.fromJson(
          jsonDecode(response.data as String) as Map<String, dynamic>,
        );
        userDetail = user;
      } else if (response.statusCode == 403) {
        userDetail = null;
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    try {
      final response = await _apiService.postRequestWithoutData('/user/logout');
      if (response.statusCode == 200) {
        userDetail = null;
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
