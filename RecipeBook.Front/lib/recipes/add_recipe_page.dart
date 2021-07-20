import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HeaderWidget(title: title),
            Padding(
              padding: const EdgeInsets.only(top: 127, left: 120, right: 120),
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
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
                                            .copyWith(color: Palette.orange),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 53),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
