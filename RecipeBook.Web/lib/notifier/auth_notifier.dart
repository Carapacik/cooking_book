import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/model/user_detail.dart';
import 'package:recipebook/service/api_service.dart';

class AuthNotifier extends ChangeNotifier {
  UserDetail? _userDetail;
  final ApiService _apiService = ApiService();

  UserDetail? get userDetail => _userDetail;

  setUser(UserDetail? userDetail) {
    _userDetail = userDetail;
    notifyListeners();
  }

  Future getUser() async {
    Response response;

    try {
      response = await _apiService.getRequest("/user/get-user");
      if (response.statusCode == 200) {
        final userDetail = UserDetail.fromJson(jsonDecode(response.data as String) as Map<String, dynamic>);
        setUser(userDetail);
      } else if (response.statusCode == 403) {
        setUser(null);
      } else {
        //затычка
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }
}
