import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  static const baseImageStorage = "http://localhost:5000/static/images/";

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
          child: CachedNetworkImage(
            imageUrl: baseImageStorage + imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(value: downloadProgress.progress, color: Palette.orange),
            ),
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
