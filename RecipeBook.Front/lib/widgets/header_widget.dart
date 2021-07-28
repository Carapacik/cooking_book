import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/route.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key? key, required this.currentSelectedPage}) : super(key: key);

  final HeaderButtons currentSelectedPage;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  List<HeaderButtons> headerButtons = HeaderButtons.values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 120, right: 120, top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                context.vxNav.push(Uri.parse(RecipeRoutes.homeRoute));
              },
              style: TextButton.styleFrom(
                primary: Palette.orange,
              ),
              child: const Text(
                "Recipes",
                style: TextStyle(
                  color: Palette.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 80),
            ...List.generate(
              headerButtons.length,
              (index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 40),
                child: TextButton(
                  onPressed: () {
                    context.vxNav.push(Uri.parse(HeaderButtons.getById(index).route));
                  },
                  style: TextButton.styleFrom(
                    primary: Palette.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      HeaderButtons.getById(index).name,
                      style: widget.currentSelectedPage.index == index
                          ? const TextStyle(
                              color: Palette.mainLighten2,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )
                          : const TextStyle(
                              color: Palette.grey,
                              fontSize: 18,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Palette.orange,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    CookingIcons.login,
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Войти",
                    style: TextStyle(
                      color: Palette.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
