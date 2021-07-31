import 'package:flutter/material.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';

class RecipeImageWithAuthor extends StatelessWidget {
  const RecipeImageWithAuthor({
    Key? key,
    required this.imageUrl,
    required this.username,
    required this.size,
  }) : super(key: key);

  final String imageUrl;
  final String username;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(72),
              bottomRight: Radius.circular(72),
            ),
          ),
          // child: CachedNetworkImage(
          child: Image.asset(
            CookingImages.homeBackground,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 38),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
          ),
          child: Text(
            username,
            style: Theme.of(context).textTheme.r16.copyWith(color: Palette.orange, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
