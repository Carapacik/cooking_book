import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/header_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

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
            const HeaderWidget(currentSelectedPage: HeaderButtons.favorite),
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 120, right: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Избранное",
                    style: Theme.of(context).textTheme.b42,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
