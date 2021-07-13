import 'package:cookingbook/resources/icons.dart';
import 'package:cookingbook/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleSpacing: 80,
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "Recipes",
            style: TextStyle(
              color: Palette.orange,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Главная",
                style: TextStyle(
                  color: Palette.main,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 40),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Рецепты",
                style: TextStyle(
                  color: Palette.main,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 40),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Избранное",
                style: TextStyle(
                  color: Palette.main,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
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
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
