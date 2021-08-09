import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/login_dialog.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class UserData {
  UserData();

  late String login;
  late String name;
  late String password;
}

void registrationDialog(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserData user = UserData();
  String? currentPassword;

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
              hintText: "Имя",
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                return null;
              },
              onSaved: (value) {
                user.name = value!;
              },
            ),
            const SizedBox(height: 20),
            FormTextFieldWidget(
              hintText: "Логин",
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                return null;
              },
              onSaved: (value) {
                user.login = value!;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: FormTextFieldWidget(
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
                      hintText: "Повторите пароль",
                      validator: (value) {
                        if (value!.isEmpty) return "Не может быть пустым";
                        if (value != currentPassword) return "Пароли не совпадают";
                        return null;
                      },
                      onSaved: (value) {
                        user.password = value!;
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
                  onPressed: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();
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
