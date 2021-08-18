import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/profile/components/profile_card.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthNotifier _authNotifier;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? loginController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  bool readOnlyTextField = true;

  @override
  void initState() {
    _authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if (_authNotifier.userDetail != null) {
      nameController?.text = _authNotifier.userDetail!.name;
      loginController?.text = _authNotifier.userDetail!.login;
      if (_authNotifier.userDetail!.description != null) {
        descriptionController?.text = _authNotifier.userDetail!.description!;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController?.dispose();
    loginController?.dispose();
    descriptionController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              CookingImages.wave1,
              color: Palette.wave,
              width: MediaQuery.of(context).size.width,
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                margin: const EdgeInsets.only(top: 127),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.beamBack();
                      },
                      style: TextButton.styleFrom(primary: Palette.orange),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Назад",
                            style: Theme.of(context).textTheme.n18,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      "Мой профиль",
                      style: Theme.of(context).textTheme.b42,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Palette.shadowColor,
                            offset: Offset(0, 16),
                            blurRadius: 72,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 60, right: 73, left: 73),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 542,
                                  child: Column(
                                    children: [
                                      FormTextFieldWidget(
                                        hintText: "Имя",
                                        keyboardType: TextInputType.name,
                                        controller: nameController,
                                        readOnly: readOnlyTextField,
                                      ),
                                      const SizedBox(height: 20),
                                      FormTextFieldWidget(
                                        hintText: "Логин",
                                        controller: loginController,
                                        readOnly: readOnlyTextField,
                                      ),
                                      const SizedBox(height: 20),
                                      FormTextFieldWidget(
                                        obscureText: true,
                                        keyboardType: TextInputType.visiblePassword,
                                        hintText: "Пароль",
                                        controller: passwordController,
                                        readOnly: readOnlyTextField,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 472,
                                  child: FormTextFieldWidget(
                                    keyboardType: TextInputType.multiline,
                                    hintText: "Напишите немного о себе",
                                    height: 180,
                                    textarea: true,
                                    controller: descriptionController,
                                    readOnly: readOnlyTextField,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProfileCard(value: 15, text: "Всего рецептов"),
                        ProfileCard(value: 15, text: "Всего лайков"),
                        ProfileCard(value: 15, text: "В избранных"),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Мои рецепты",
                      style: Theme.of(context).textTheme.b24,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
