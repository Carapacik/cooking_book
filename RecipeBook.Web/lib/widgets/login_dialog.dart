import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/auth_result.dart';
import 'package:recipebook/model/auth_user_command.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/register_dialog.dart';

void loginDialog(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final apiService = ApiService();
  final user = AuthUserCommand();
  final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  bool isUserExist = true;
  bool isPasswordCorrect = true;

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
              keyboardType: TextInputType.name,
              hintText: "Логин",
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                if (!isUserExist) return "Такого пользователя не существует";
                return null;
              },
              onChanged: (value) {
                isUserExist = true;
              },
              onSaved: (value) {
                user.login = value;
              },
            ),
            const SizedBox(height: 20),
            FormTextFieldWidget(
              hintText: "Пароль",
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) return "Не может быть пустым";
                if (!isPasswordCorrect) return "Неправильный пароль";
                return null;
              },
              onChanged: (value) {
                isPasswordCorrect = true;
              },
              onSaved: (value) {
                user.password = value;
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
                      try {
                        final result = await apiService.postRequest("user/login", user.toJson());
                        final authResult = AuthResult.fromJson(result as Map<String, dynamic>);
                        if (authResult.isSuccess == true) {
                          Navigator.of(context).pop();
                          authNotifier.getCurrentUser();
                          context.beamToNamed("/");
                        } else if (authResult.errorMessage == "user") {
                          form.setState(() {
                            isUserExist = false;
                          });
                          form.validate();
                        } else if (authResult.errorMessage == "password") {
                          form.setState(() {
                            isPasswordCorrect = false;
                          });
                          form.validate();
                        } else {
                          context.beamToNamed("/error?e=Not found");
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
                  registerDialog(context);
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
