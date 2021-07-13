import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final List<String> _buttonNames = ["Главная", "Рецепты", "Избранное"];
  int _currentSelectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120, top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
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
          const SizedBox(width: 80),
          ...List.generate(
            _buttonNames.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 40),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    _buttonNames[index],
                    style: _currentSelectedButton == index
                        ? const TextStyle(
                            color: Palette.mainLighten,
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
    );
  }
}
