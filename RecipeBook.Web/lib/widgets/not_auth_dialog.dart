import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/login_dialog.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/register_dialog.dart';

void notAuthDialog(BuildContext context, String text) {
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
    content: Container(
      constraints: const BoxConstraints(maxWidth: 580, minWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Войдите в профиль",
            style: Theme.of(context).textTheme.b24,
          ),
          const SizedBox(height: 30),
          Text(
            text,
            style: Theme.of(context).textTheme.r18,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              ButtonContainedWidget(
                text: "Войти",
                width: 278,
                height: 60,
                onPressed: () {
                  Navigator.of(context).pop();
                  loginDialog(context);
                },
              ),
              const SizedBox(width: 24),
              ButtonOutlinedWidget(
                text: "Регистрация",
                width: 278,
                height: 60,
                onPressed: () {
                  Navigator.of(context).pop();
                  registerDialog(context);
                },
              ),
            ],
          ),
        ],
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
