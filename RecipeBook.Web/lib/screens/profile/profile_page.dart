import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/profile_command.dart';
import 'package:recipebook/model/profile_model.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/notifier/recipe_notifier.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/profile/components/profile_card.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/error_snack_bar.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/recipe_list_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ApiService _apiService;
  ProfileModel? profileDetail;
  late RecipeNotifier _recipeNotifier;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? loginController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileCommand? profileCommand;
  bool readOnlyTextField = true;
  bool isLoading = true;
  bool isEndOfList = true;
  int skipCounter = 0;

  Future getDetailProfile() async {
    Response response;

    try {
      response = await _apiService.getRequest("user/profile");
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          profileDetail = ProfileModel.fromJson(jsonDecode(response.data as String) as Map<String, dynamic>);
        });
        nameController?.text = profileDetail!.name;
        loginController?.text = profileDetail!.login;
        if (profileDetail!.description != null) {
          descriptionController?.text = profileDetail!.description!;
        }
        profileCommand = ProfileCommand(
          name: profileDetail!.name,
          login: profileDetail!.login,
          description: profileDetail!.description,
        );
      } else {
        // код не 200
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  Future getMoreRecipes() async {
    Response response;

    try {
      response = await _apiService.getRequestWithParam(endPoint: "recipes/user-owned", take: 4, skip: skipCounter);
      if (response.statusCode == 200) {
        final listOfRecipes = jsonDecode(response.data as String) as List<dynamic>;
        if (listOfRecipes.length == 4) {
          setState(() {
            isEndOfList = false;
          });
        }
        _recipeNotifier.addRecipes(listOfRecipes);
        skipCounter += 4;
      } else {
        // затычка, код не 200
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  Future getInitialRecipes() async {
    Response response;

    try {
      response = await _apiService.getInitialWithParam("recipes/user-owned", 2);
      if (response.statusCode == 200) {
        _recipeNotifier.resultString = "Ваш список пуст";
        _recipeNotifier.addClearRecipes(jsonDecode(response.data as String) as List<dynamic>);
        skipCounter += 2;
      } else {
        // затычка, код не 200
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  @override
  void initState() {
    _recipeNotifier = Provider.of<RecipeNotifier>(context, listen: false);
    _apiService = ApiService();
    getDetailProfile();
    getInitialRecipes();
    super.initState();
  }

  @override
  void dispose() {
    nameController?.dispose();
    loginController?.dispose();
    descriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authNotifier = Provider.of<AuthNotifier>(context, listen: false);
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
                alignment: Alignment.topLeft,
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
                      isLoading ? "Загрузка профиля..." : "Мой профиль",
                      style: Theme.of(context).textTheme.b42,
                    ),
                    const SizedBox(height: 50),
                    if (!isLoading)
                      Container(
                        clipBehavior: Clip.antiAlias,
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
                              padding: const EdgeInsets.only(top: 20, right: 20),
                              child: readOnlyTextField
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          readOnlyTextField = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Palette.grey.withOpacity(0.5),
                                        size: 18,
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () async {
                                        final form = _formKey.currentState!;
                                        if (form.validate()) {
                                          form.save();
                                          try {
                                            await _apiService.patchRequest("user/profile/edit", profileCommand!.toJson());
                                            readOnlyTextField = true;
                                            _authNotifier.getCurrentUser();
                                            getDetailProfile();
                                          } catch (e) {
                                            errorSnackBar(context, "Ошибка изменения: $e");
                                          }
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Palette.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Подтвердить",
                                          style: Theme.of(context).textTheme.r18.copyWith(color: Palette.grey.withOpacity(0.8)),
                                        ),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, bottom: 60, right: 73, left: 73),
                              child: Form(
                                key: _formKey,
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
                                            validator: (value) {
                                              if (value!.isEmpty) return "Не может быть пустым";
                                              return null;
                                            },
                                            onSaved: (value) {
                                              profileCommand!.name = value!;
                                            },
                                          ),
                                          const SizedBox(height: 20),
                                          FormTextFieldWidget(
                                            hintText: "Логин",
                                            controller: loginController,
                                            readOnly: readOnlyTextField,
                                            validator: (value) {
                                              if (value!.isEmpty) return "Не может быть пустым";
                                              if (value.length > 20) return "Логин меньше 20 символов";
                                              return null;
                                            },
                                            onSaved: (value) {
                                              profileCommand!.login = value!;
                                            },
                                          ),
                                          const SizedBox(height: 20),
                                          FormTextFieldWidget(
                                            obscureText: true,
                                            keyboardType: TextInputType.visiblePassword,
                                            hintText: "Пароль",
                                            readOnly: readOnlyTextField,
                                            validator: (value) {
                                              if (value!.isEmpty) return "Не может быть пустым";
                                              if (value.length < 8) return "Минимум 8 символов";
                                              return null;
                                            },
                                            onSaved: (value) {
                                              profileCommand!.password = value;
                                            },
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
                                        validator: (value) {
                                          if (value!.isNotEmpty && value.length > 150) return "Максимум 150 символов";
                                          return null;
                                        },
                                        onSaved: (value) {
                                          profileCommand!.description = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 40),
                    if (!isLoading)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileCard(value: profileDetail!.recipesCount, text: "Всего рецептов"),
                          ProfileCard(value: profileDetail!.likesCount, text: "Всего лайков"),
                          ProfileCard(value: profileDetail!.favoritesCount, text: "В избранных"),
                        ],
                      ),
                    const SizedBox(height: 40),
                    Text(
                      "Мои рецепты",
                      style: Theme.of(context).textTheme.b24,
                    ),
                    const SizedBox(height: 40),
                    const Center(child: RecipeListWidget()),
                    const SizedBox(height: 73),
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
