import 'dart:async';
import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/model/recipe_command.dart';
import 'package:recipe_book_flutter/model/recipe_detail.dart';
import 'package:recipe_book_flutter/notifier/ingredient_notifier.dart';
import 'package:recipe_book_flutter/notifier/step_notifier.dart';
import 'package:recipe_book_flutter/resources/icons.dart';
import 'package:recipe_book_flutter/resources/images.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipe_book_flutter/screens/recipes/components/ingredient_list_widget.dart';
import 'package:recipe_book_flutter/screens/recipes/components/step_list_widget.dart';
import 'package:recipe_book_flutter/service/api_service.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/contained_button.dart';
import 'package:recipe_book_flutter/widgets/error_snack_bar.dart';
import 'package:recipe_book_flutter/widgets/header_buttons.dart';
import 'package:recipe_book_flutter/widgets/header_widget.dart';
import 'package:recipe_book_flutter/widgets/outlined_button.dart';

class RecipeFormPage extends StatefulWidget {
  const RecipeFormPage({
    this.recipeId,
    super.key,
  });

  final String? recipeId;

  @override
  _RecipeFormPageState createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends State<RecipeFormPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagsController = TextEditingController();
  final cookingTimeController = TextEditingController();
  final portionsCountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const baseImageStorage = 'http://localhost:5000/storage/images/';
  late ApiService apiService;
  RecipeDetail? recipeDetail;
  FilePickerResult? result;
  bool isFilePicked = true;
  bool isLoading = true;
  String? recipeTitle;
  String? recipeDescription;
  String? cookingTime;
  String? portionsCount;
  List<String> tags = [];

  @override
  void initState() {
    apiService = ApiService();
    if (widget.recipeId != null) {
      unawaited(getDetailRecipe());
    }
    super.initState();
  }

  Future<void> getDetailRecipe() async {
    Response<dynamic> response;

    try {
      response = await apiService.getRequest('recipes/${widget.recipeId}');
      if (response.statusCode == 200) {
        recipeDetail = RecipeDetail.fromJson(
          jsonDecode(response.data as String) as Map<String, dynamic>,
        );
        titleController.text = recipeDetail!.title;
        descriptionController.text = recipeDetail!.description;
        cookingTimeController.text =
            recipeDetail!.cookingTimeInMinutes.toString();
        portionsCountController.text = recipeDetail!.portionsCount.toString();
        tagsController.text = recipeDetail!.tags.join(', ');
        setState(() {
          isLoading = false;
        });
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
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
    final stepNotifier = Provider.of<StepNotifier>(context);
    final ingredientNotifier = Provider.of<IngredientNotifier>(context);

    if (widget.recipeId != null) {
      if (isLoading) {
        return const Center(
          child: CircularProgressIndicator(color: Palette.orange),
        );
      }
      stepNotifier.replaceList(recipeDetail!.steps);
      ingredientNotifier.replaceList(recipeDetail!.ingredients);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              CookingImages.wave1,
              width: MediaQuery.of(context).size.width,
              colorFilter:
                  const ColorFilter.mode(Palette.wave, BlendMode.srcIn),
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
            Center(
              child: Container(
                alignment: Alignment.topLeft,
                constraints: const BoxConstraints(maxWidth: 1200),
                margin: const EdgeInsets.only(top: 127),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.beamBack();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Palette.orange,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              size: 18,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Назад',
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
                            recipeDetail == null
                                ? 'Добавить новый рецепт'
                                : 'Редактировать рецепт',
                            style: Theme.of(context).textTheme.b42,
                          ),
                          ButtonContainedWidget(
                            text: recipeDetail == null
                                ? 'Опубликовать'
                                : 'Изменить',
                            width: 278,
                            height: 60,
                            onPressed: _getSendingFunction(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      DecoratedBox(
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
                                result = await FilePicker.platform
                                    .pickFiles(type: FileType.image);
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
                                foregroundColor: Palette.orange,
                                backgroundColor: !isFilePicked
                                    ? Palette.red.withOpacity(0.4)
                                    : Palette.uploadPhotoBackground,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(72),
                                    bottomRight: Radius.circular(72),
                                  ),
                                ),
                              ),
                              child: _getUploadedImageButton(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 53, right: 70),
                              child: SizedBox(
                                width: 647,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FormTextFieldWidget(
                                      controller: titleController,
                                      hintText: 'Название рецепта',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Название рецепта обязательно';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        recipeTitle = value;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    FormTextFieldWidget(
                                      keyboardType: TextInputType.multiline,
                                      controller: descriptionController,
                                      textarea: true,
                                      height: 120,
                                      hintText:
                                          'Краткое описание рецепта (150 символов)',
                                      maxLength: 150,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Описание рецепта обязательно';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        recipeDescription = value;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    FormTextFieldWidget(
                                      controller: tagsController,
                                      hintText: 'Добавить теги',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Введите хотя бы один тэг';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        tags = value!.trim().split(',');
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        FormTextFieldWidget(
                                          width: 220,
                                          controller: cookingTimeController,
                                          keyboardType: TextInputType.number,
                                          hintText: 'Время готовки',
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Не должно быть пустым';
                                            }
                                            final result =
                                                int.tryParse(value) ?? '';
                                            if (result == '') {
                                              return 'Должно быть целым';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            cookingTime = value;
                                          },
                                        ),
                                        const SizedBox(width: 11),
                                        Text(
                                          'Минут',
                                          style: Theme.of(context)
                                              .textTheme
                                              .r16
                                              .copyWith(color: Palette.main),
                                        ),
                                        const SizedBox(width: 64),
                                        FormTextFieldWidget(
                                          width: 220,
                                          controller: portionsCountController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          hintText: 'Порций в блюде',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Не должно быть пустым';
                                            }
                                            final result =
                                                int.tryParse(value) ?? '';
                                            if (result == '') {
                                              return 'Должно быть целым';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            portionsCount = value;
                                          },
                                        ),
                                        const SizedBox(width: 11),
                                        Text(
                                          'Персон',
                                          style: Theme.of(context)
                                              .textTheme
                                              .r16
                                              .copyWith(color: Palette.main),
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
                                  'Ингредиенты',
                                  style: Theme.of(context).textTheme.b20,
                                ),
                                const IngredientListWidget(),
                                const SizedBox(height: 40),
                                ButtonOutlinedWidget(
                                  text: 'Добавить заголовок',
                                  width: 380,
                                  height: 60,
                                  onPressed:
                                      ingredientNotifier.addNewIngredient,
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
                                  text: 'Добавить шаг',
                                  width: 380,
                                  height: 60,
                                  onPressed: stepNotifier.addStep,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 106),
                    ],
                  ),
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
      return Palette.red;
    } else {
      return Palette.orange;
    }
  }

  String _getText() {
    if (!isFilePicked) {
      return 'Необходимо загрузить\nфотографию';
    } else {
      return 'Загрузите фото\nготового блюда';
    }
  }

  Widget _getUploadedImageButton() {
    if (result != null) {
      return SizedBox(
        height: 430,
        width: 430,
        child: Image.memory(
          result!.files.single.bytes!,
          fit: BoxFit.cover,
        ),
      );
    } else if (!isFilePicked) {
      return Stack(
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
                        colorFilter:
                            ColorFilter.mode(_getColor(), BlendMode.srcIn),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _getText(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .r16
                            .copyWith(color: _getColor()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (recipeDetail != null) {
      return SizedBox(
        height: 430,
        width: 430,
        child: CachedNetworkImage(
          imageUrl: baseImageStorage + recipeDetail!.imageUrl,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Stack(
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
                        colorFilter:
                            ColorFilter.mode(_getColor(), BlendMode.srcIn),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _getText(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .r16
                            .copyWith(color: _getColor()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  VoidCallback? _getSendingFunction(BuildContext context) {
    if (!isFilePicked ||
        (isFilePicked && result == null && recipeDetail == null)) {
      // Кнопка не будет нажиматься
      return null;
    }

    final stepNotifier = Provider.of<StepNotifier>(context);
    final ingredientNotifier = Provider.of<IngredientNotifier>(context);
    return () async {
      final beamer = Beamer.of(context);
      final form = _formKey.currentState!;
      if (form.validate()) {
        form.save();

        final recipeCommand = RecipeCommand(
          recipeId: recipeDetail != null ? recipeDetail!.recipeId : 0,
          title: recipeTitle!,
          description: recipeDescription!,
          cookingTimeInMinutes: int.parse(cookingTime!),
          portionsCount: int.parse(portionsCount!),
          tags: tags
              .map((e) => e.trim())
              .where((element) => element.isNotEmpty)
              .toSet()
              .toList(),
          steps: stepNotifier.stepList,
          ingredients: ingredientNotifier.ingredientList.toList(),
        );

        late FormData formData;
        if (recipeDetail != null) {
          if (result != null) {
            formData = FormData.fromMap({
              'data': jsonEncode(recipeCommand),
              'file': MultipartFile.fromBytes(
                result!.files.single.bytes!.toList(),
                filename: result!.files.single.name,
              ),
            });
          } else {
            formData = FormData.fromMap({
              'data': jsonEncode(recipeCommand),
            });
          }
          try {
            late String nextPageIndex;
            await apiService
                .patchRequest(
                  'recipes/${recipeDetail!.recipeId}/edit',
                  formData,
                )
                .then((value) => nextPageIndex = value.toString());
            beamer.beamToNamed('/recipes/$nextPageIndex');

            stepNotifier.clearList();
            ingredientNotifier.clearList();
          } on Exception catch (e) {
            errorSnackBar(context, 'Ошибка изменения: $e');
          }
        } else {
          formData = FormData.fromMap({
            'data': jsonEncode(recipeCommand),
            'file': MultipartFile.fromBytes(
              result!.files.single.bytes!.toList(),
              filename: result!.files.single.name,
            ),
          });

          try {
            late String nextPageIndex;
            await apiService
                .postRequest('recipes', formData)
                .then((value) => nextPageIndex = value.toString());

            beamer.beamToNamed('/recipes/$nextPageIndex');

            stepNotifier.clearList();
            ingredientNotifier.clearList();
          } on Exception catch (e) {
            errorSnackBar(context, 'Ошибка добавления: $e');
          }
        }
      }
    };
  }
}
