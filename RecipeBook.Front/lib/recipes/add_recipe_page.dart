import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/recipes/components/ingredient_item_widget.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class AddRecipePage extends StatelessWidget {
  AddRecipePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HeaderWidget(title: title),
            Padding(
              padding: const EdgeInsets.only(top: 127, left: 120, right: 120),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          CookingIcons.arrowBack,
                          height: 12,
                          width: 18,
                        ),
                        const SizedBox(width: 13),
                        Text(
                          "Назад",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Palette.orange),
                        )
                      ],
                    ),
                    const SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Добавить новый рецепт",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        ButtonContainedWidget(
                          text: "Опубликовать",
                          width: 278,
                          height: 60,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // логика отправки данных
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
                          Stack(
                            children: [
                              Container(
                                height: 430,
                                width: 430,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  color: Palette.uploadPhotoBackground,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(72),
                                    bottomRight: Radius.circular(72),
                                  ),
                                ),
                                child: Center(
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Palette.orange,
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
                                            color: Palette.orange,
                                          ),
                                          const SizedBox(height: 30),
                                          Text(
                                            "Загрузите фото\nготового блюда",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    color: Palette.orange),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 53, right: 70),
                            child: SizedBox(
                              width: 647,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FormTextFieldWidget(
                                    height: 50,
                                    hintText: "Название рецепта",
                                  ),
                                  const SizedBox(height: 20),
                                  const FormTextFieldWidget(
                                    textarea: true,
                                    height: 120,
                                    hintText:
                                        "Краткое описание рецепта (150 символов)",
                                    maxLength: 150,
                                  ),
                                  const SizedBox(height: 20),
                                  const FormTextFieldWidget(
                                    height: 50,
                                    hintText: "Добавить теги",
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 220,
                                        child: FormTextFieldWidget(
                                          height: 50,
                                          hintText: "Время готовки",
                                        ),
                                      ),
                                      const SizedBox(width: 11),
                                      Text(
                                        "Минут",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Palette.main),
                                      ),
                                      const SizedBox(width: 64),
                                      const SizedBox(
                                        width: 220,
                                        child: FormTextFieldWidget(
                                          height: 50,
                                          hintText: "Порций в блюде",
                                        ),
                                      ),
                                      const SizedBox(width: 11),
                                      Text(
                                        "Персон",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
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
                      children: [
                        SizedBox(
                          width: 380,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ингридиенты",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const IngredientItemWidget(),
                              const SizedBox(height: 40),
                              const ButtonOutlinedWidget(
                                text: "Добавить заголовок",
                                width: 380,
                                height: 60,
                              )
                            ],
                          ),
                        ),
                        Column(),
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
}
