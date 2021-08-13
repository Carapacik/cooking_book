import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/user_detail.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/login_dialog.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key, this.currentSelectedPage}) : super(key: key);

  final HeaderButtons? currentSelectedPage;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late ApiService apiService;
  late AuthNotifier authNotifier;
  late UserDetail? userDetail;

  Future logout() async {
    Response response;

    try {
      response = await apiService.getRequest("/user/logout");
      print(response.statusCode);
      if (response.statusCode == 200) {
        authNotifier.setUser(null);
        setState(() {});
      } else {
        setState(() {});
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  Future getUser() async {
    Response response;

    try {
      response = await apiService.getRequest("/user/get-user");
      if (response.statusCode == 200) {
        userDetail = UserDetail.fromJson(jsonDecode(response.data as String) as Map<String, dynamic>);
        authNotifier.setUser(userDetail);
        setState(() {});
      } else if (response.statusCode == 403) {
        authNotifier.setUser(null);
        setState(() {});
      } else {
        //затычка
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  @override
  void initState() {
    apiService = ApiService();
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if (authNotifier.userDetail == null) {
      getUser();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 120, right: 120, top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Recipes",
              style: Theme.of(context).textTheme.b24.copyWith(color: Palette.orange),
            ),
            const SizedBox(width: 80),
            ...List.generate(
              3,
              (index) => TextButton(
                onPressed: () {
                  context.beamToNamed(HeaderButtons.getById(index).route);
                },
                style: TextButton.styleFrom(
                  primary: Palette.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    HeaderButtons.getById(index).name,
                    style: widget.currentSelectedPage?.index == index
                        ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                        : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                TextButton(
                  onPressed: authNotifier.userDetail == null
                      ? () {
                          loginDialog(context);
                        }
                      : () {
                          context.beamToNamed("/profile");
                        },
                  style: TextButton.styleFrom(primary: Palette.orange),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        CookingIcons.login,
                        width: 38,
                        height: 38,
                      ),
                      const SizedBox(width: 14),
                      Text(
                        authNotifier.userDetail == null ? "Войти" : "Привет, ${authNotifier.userDetail!.name}",
                        style: Theme.of(context).textTheme.b18.copyWith(color: Palette.orange),
                      )
                    ],
                  ),
                ),
                if (authNotifier.userDetail != null)
                  IconButton(
                    onPressed: () {
                      logout();
                      context.beamToNamed("/");
                    },
                    splashRadius: 16,
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Palette.grey,
                      size: 18,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
