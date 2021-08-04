import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key, this.currentSelectedPage}) : super(key: key);

  final HeaderButtons? currentSelectedPage;

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
                context.beamToNamed('/');
              },
              style: TextButton.styleFrom(
                primary: Palette.orange,
              ),
              child: Text(
                "Recipes",
                style: Theme.of(context).textTheme.b24,
              ),
            ),
            const SizedBox(width: 80),
            ...List.generate(
              headerButtons.length,
              (index) => TextButton(
                onPressed: () {
                  context.beamToNamed(HeaderButtons.getById(index).route);
                },
                style: TextButton.styleFrom(
                  primary: Palette.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(HeaderButtons.getById(index).name,
                      style: widget.currentSelectedPage?.index == index
                          ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                          : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey)),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Palette.orange),
              child: Row(
                children: [
                  SvgPicture.asset(
                    CookingIcons.login,
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    "Войти",
                    style: Theme.of(context).textTheme.b18.copyWith(color: Palette.orange),
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
