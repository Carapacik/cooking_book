import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/add_recipe.dart';
import 'package:recipebook/notifier/ingredient_notifier.dart';
import 'package:recipebook/notifier/step_notifier.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/screens/recipes/components/ingredient_list_widget.dart';
import 'package:recipebook/screens/recipes/components/step_list_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class AddRecipePage extends StatefulWidget {
  AddRecipePage({Key? key}) : super(key: key);

  String? recipeTitle;
  String? recipeDescription;
  String? cookingTime;
  String? portionsCount;
  List<String> tags = [];

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  late ApiService apiService;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagsController = TextEditingController();
  final cookingTimeController = TextEditingController();
  final portionsCountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  bool isFilePicked = true;

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    tagsController.dispose();
    cookingTimeController.dispose();
    portionsCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StepNotifier stepNotifier = Provider.of<StepNotifier>(context);
    final IngredientNotifier ingredientNotifier = Provider.of<IngredientNotifier>(context);

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
            Padding(
              padding: const EdgeInsets.only(top: 127, left: 120, right: 120),
              child: Form(
                key: _formKey,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Добавить новый рецепт",
                          style: Theme.of(context).textTheme.b42,
                        ),
                        ButtonContainedWidget(
                          text: "Опубликовать",
                          width: 278,
                          height: 60,
                          onPressed: result == null
                              ? null
                              : () async {
                                  final form = _formKey.currentState!;
                                  if (form.validate()) {
                                    form.save();

                                    final AddRecipe recipe = AddRecipe(
                                      title: widget.recipeTitle!,
                                      description: widget.recipeDescription!,
                                      cookingTimeInMinutes: int.parse(widget.cookingTime!),
                                      portionsCount: int.parse(widget.portionsCount!),
                                      tags: widget.tags,
                                      steps: stepNotifier.stepList,
                                      ingredients: ingredientNotifier.ingredientList.toList(),
                                    );

                                    final formData = FormData.fromMap({
                                      'recipe': jsonEncode(recipe),
                                      'file': MultipartFile.fromBytes(result!.files.single.bytes!.toList(), filename: result!.files.single.name),
                                    });

                                    String nextPageIndex = "";
                                    try {
                                      await apiService.postRequest("recipes", formData).then((value) => nextPageIndex = value.toString());
                                    } catch (e) {
                                      context.beamToNamed("/error");
                                    }
                                    context.beamToNamed("/recipes/$nextPageIndex");
                                  }
                                },
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 72,
                            color: Palette.shadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              result = await FilePicker.platform.pickFiles(type: FileType.image);
                              if (result == null) {
                                setState(() {
                                  isFilePicked = false;
                                });
                              } else {
                                setState(() {
                                  isFilePicked = true;
                                });
                              }
                            },
                            clipBehavior: Clip.antiAlias,
                            style: TextButton.styleFrom(
                              backgroundColor: Palette.uploadPhotoBackground,
                              primary: Palette.orange,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(72),
                                  bottomRight: Radius.circular(72),
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 430,
                                  width: 430,
                                  child: Center(
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      color: _getColor(),
                                      radius: const Radius.circular(20),
                                      child: SizedBox(
                                        height: 269,
                                        width: 269,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 80),
                                            SvgPicture.asset(
                                              CookingIcons.upload,
                                              height: 42,
                                              width: 42,
                                              color: _getColor(),
                                            ),
                                            const SizedBox(height: 30),
                                            Text(
                                              _getText(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.r16.copyWith(color: _getColor()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 53, right: 70),
                            child: SizedBox(
                              width: 647,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FormTextFieldWidget(
                                    controller: titleController,
                                    hintText: "Название рецепта",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Название рецепта обязательно";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      widget.recipeTitle = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  FormTextFieldWidget(
                                    controller: descriptionController,
                                    textarea: true,
                                    height: 120,
                                    hintText: "Краткое описание рецепта (150 символов)",
                                    maxLength: 150,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Описание рецепта обязательно";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      widget.recipeDescription = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  FormTextFieldWidget(
                                    controller: tagsController,
                                    hintText: "Добавить теги",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Введите хотя бы один тэг";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      widget.tags = value!.trim().split(",");
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      FormTextFieldWidget(
                                        width: 220,
                                        controller: cookingTimeController,
                                        keyboardType: TextInputType.number,
                                        hintText: "Время готовки",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Не должно быть пустым";
                                          }
                                          final result = int.tryParse(value) ?? "";
                                          if (result == "") {
                                            return "Должно быть целым";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          widget.cookingTime = value;
                                        },
                                      ),
                                      const SizedBox(width: 11),
                                      Text(
                                        "Минут",
                                        style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
                                      ),
                                      const SizedBox(width: 64),
                                      FormTextFieldWidget(
                                        width: 220,
                                        controller: portionsCountController,
                                        keyboardType: TextInputType.number,
                                        hintText: "Порций в блюде",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Не должно быть пустым";
                                          }
                                          final result = int.tryParse(value) ?? "";
                                          if (result == "") {
                                            return "Должно быть целым";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          widget.portionsCount = value;
                                        },
                                      ),
                                      const SizedBox(width: 11),
                                      Text(
                                        "Персон",
                                        style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 380,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ингредиенты",
                                style: Theme.of(context).textTheme.b20,
                              ),
                              const IngredientListWidget(),
                              const SizedBox(height: 40),
                              ButtonOutlinedWidget(
                                text: "Добавить заголовок",
                                width: 380,
                                height: 60,
                                onPressed: () {
                                  ingredientNotifier.addNewIngredient();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 790,
                            child: Column(
                              children: [
                                const StepListWidget(),
                                ButtonOutlinedWidget(
                                  text: "Добавить шаг",
                                  width: 380,
                                  height: 60,
                                  onPressed: () {
                                    stepNotifier.addStep();
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 106),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor() {
    if (!isFilePicked) {
      return Colors.red;
    } else if (result == null) {
      return Palette.orange;
    } else {
      return Colors.green;
    }
  }

  String _getText() {
    if (!isFilePicked) {
      return "Необходимо загрузить\nфотографию";
    } else if (result == null) {
      return "Загрузите фото\nготового блюда";
    } else {
      return "Фотография готова\nк отправке";
    }
  }
}
