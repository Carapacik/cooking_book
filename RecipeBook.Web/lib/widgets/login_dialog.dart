import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/model/user.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/registration_dialog.dart';

void loginDialog(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final apiService = ApiService();
  final user = User();
  bool isLoginExist = true;

  final alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    title: Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
        splashRadius: 20,
        color: Palette.grey,
      ),
    ),
    content: Form(
      key: _formKey,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 580, minWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Войти",
              style: Theme.of(context).textTheme.b24,
            ),
            const SizedBox(height: 45),
            FormTextFieldWidget(
              hintText: "Логин",
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                if (!isLoginExist) return "Такого логина не существует";
                return null;
              },
              onSaved: (value) {
                user.name = value;
              },
            ),
            const SizedBox(height: 20),
            FormTextFieldWidget(
              hintText: "Пароль",
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                if (value.length < 8) return "Минимум 8 символов";
                return null;
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ButtonContainedWidget(
                  text: "Войти",
                  width: 278,
                  height: 60,
                  onPressed: () async {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();

                      final userData = User(
                        password: user.password,
                        login: user.login,
                      );
                      try {
                        late dynamic next;
                        await apiService.postRequest("user/login", userData.toJson()).then((value) => next = value);
                        final result = jsonEncode(next['result']);
                        if (result == 'true') {
                          Navigator.of(context).pop();
                          context.beamToNamed("/");
                        } else {
                          form.setState(() {
                            isLoginExist = false;
                          });
                          form.validate();
                        }
                      } catch (e) {
                        context.beamToNamed("/error?e=$e");
                      }
                      // final UserData currUser = user;
                    }
                  },
                ),
                const SizedBox(width: 24),
                ButtonOutlinedWidget(
                  text: "Отмена",
                  width: 278,
                  height: 60,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  registrationDialog(context);
                },
                style: TextButton.styleFrom(onSurface: Colors.transparent, primary: Colors.orange),
                child: Text(
                  "У меня еще нет аккаунта",
                  style: Theme.of(context).textTheme.b18.copyWith(
                        color: Palette.orange,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        height: 28 / 18,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    titlePadding: const EdgeInsets.only(top: 20, right: 20),
    contentPadding: const EdgeInsets.only(top: 16, right: 60, left: 60, bottom: 60),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
