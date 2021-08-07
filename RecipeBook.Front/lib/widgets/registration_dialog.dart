import 'package:flutter/material.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';


class UserData {
  UserData();

  late String login;
  late String name;
  late String password;
}

void registrationDialog(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserData user = UserData();
  String? currPass;

  final alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    title: Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          splashRadius: 20,
          color: Colors.grey,
        ),
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
            const Text(
              "Регистрация",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 45,
            ),
            FormTextFieldWidget(
              hintText: "Имя",
              validator: (value) {
                if (value!.isEmpty) return "Имя обязательно!";
                return null;
              },
              onSaved: (value) {
                user.name = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FormTextFieldWidget(
              hintText: "Логин",
              validator: (value) {
                if (value!.isEmpty) return "Имя обязательно!";
                return null;
              },
              onSaved: (value) {
                user.login = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: FormTextFieldWidget(
                      hintText: "Пароль",
                      onChanged: (value){
                        currPass = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Пароль обязательно!";
                        if (value.length < 8) return "Минимум 8 символов";
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: FormTextFieldWidget(
                      hintText: "Повторите пароль",
                      validator: (value) {
                        if (value!.isEmpty) return "Повторите пароль!";
                        if(value != currPass) return "Пароли не совпадают";
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: ElevatedButton(
                      onPressed: () {
                        final form = _formKey.currentState!;
                        if (form.validate()) {
                          form.save();
                          // final UserData currUser = user;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 39),
                        child: const Text("Зарегистрироваться"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 278),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 39),
                        child: const Text("Отмена"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(onSurface: Colors.transparent, primary: Colors.orange),
                child: const Text(
                  "У меня уже есть аккаунт",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    titlePadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.only(top: 16, right: 60, left: 60, bottom: 40),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}