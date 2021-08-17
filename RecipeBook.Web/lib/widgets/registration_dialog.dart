import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/user_command.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/login_dialog.dart';
import 'package:recipebook/widgets/outlined_button.dart';

void registrationDialog(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  final apiService = ApiService();
  final user = UserCommand();
  String? currentPassword;
  bool isLoginExist = false;

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
              "Регистрация",
              style: Theme.of(context).textTheme.b24,
            ),
            const SizedBox(height: 45),
            FormTextFieldWidget(
              keyboardType: TextInputType.name,
              hintText: "Имя",
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                return null;
              },
              onSaved: (value) {
                user.name = value;
              },
            ),
            const SizedBox(height: 20),
            FormTextFieldWidget(
              keyboardType: TextInputType.name,
              hintText: "Логин",
              onChanged: (value) {
                isLoginExist = false;
              },
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                if (value.length > 20) return "Логин меньше 20 символов";
                if (isLoginExist) return "Такой логин уже существует";
                return null;
              },
              onSaved: (value) {
                user.login = value;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: FormTextFieldWidget(
                      obscureText: true,
                      hintText: "Пароль",
                      onChanged: (value) {
                        currentPassword = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Не может быть пустым";
                        if (value.length < 8) return "Минимум 8 символов";
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: FormTextFieldWidget(
                      obscureText: true,
                      hintText: "Повторите пароль",
                      validator: (value) {
                        if (value!.isEmpty) return "Не может быть пустым";
                        if (value != currentPassword) return "Пароли не совпадают";
                        return null;
                      },
                      onSaved: (value) {
                        user.password = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ButtonContainedWidget(
                  text: "Зарегестрироваться",
                  width: 278,
                  height: 60,
                  onPressed: () async {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();

                      final userData = UserCommand(
                        name: user.name,
                        password: user.password,
                        login: user.login,
                      );
                      try {
                        late dynamic next;
                        await apiService.postRequest("user/register", userData.toJson()).then((value) => next = value);
                        final result = jsonEncode(next['result']);
                        if (result == 'true') {
                          Navigator.of(context).pop();
                          authNotifier.getCurrentUser();
                          context.beamToNamed("/");
                        } else {
                          form.setState(() {
                            isLoginExist = true;
                          });
                          form.validate();
                        }
                      } catch (e) {
                        context.beamToNamed("/error?e=$e");
                      }
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
                  loginDialog(context);
                },
                style: TextButton.styleFrom(onSurface: Colors.transparent, primary: Colors.orange),
                child: Text(
                  "У меня уже есть аккаунт",
                  style: Theme.of(context).textTheme.b18.copyWith(
                        color: Palette.orange,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        height: 1.6,
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
