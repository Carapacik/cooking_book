import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/auth_notifier.dart';
import 'package:recipe_book_flutter/resources/icons.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/service/api_service.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/header_buttons.dart';
import 'package:recipe_book_flutter/widgets/login_dialog.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key, this.currentSelectedPage});

  final HeaderButtons? currentSelectedPage;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late ApiService apiService;
  late AuthNotifier _authNotifier;

  @override
  void initState() {
    apiService = ApiService();
    _authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if (!_authNotifier.isAuth) {
      unawaited(_authNotifier.getCurrentUser());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authNotifier = Provider.of<AuthNotifier>(context);
    return SizedBox(
      height: 80,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: const EdgeInsets.only(top: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {
                  context.beamToNamed(HeaderButtons.home.route);
                },
                style: TextButton.styleFrom(foregroundColor: Palette.orange),
                child: Text(
                  'Recipes',
                  style: Theme.of(context)
                      .textTheme
                      .b24
                      .copyWith(color: Palette.orange),
                ),
              ),
              const SizedBox(width: 80),
              ...List.generate(
                !_authNotifier.isAuth ? 2 : 3,
                (index) => TextButton(
                  onPressed: () {
                    context.beamToNamed(HeaderButtons.getById(index).route);
                  },
                  style: TextButton.styleFrom(foregroundColor: Palette.orange),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      HeaderButtons.getById(index).name,
                      style: widget.currentSelectedPage?.index == index
                          ? Theme.of(context)
                              .textTheme
                              .b18
                              .copyWith(color: Palette.mainLighten2)
                          : Theme.of(context)
                              .textTheme
                              .r18
                              .copyWith(color: Palette.grey),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Consumer<AuthNotifier>(
                builder: (context, auth, child) => Row(
                  children: [
                    TextButton(
                      onPressed: auth.isAuth
                          ? () {
                              context.beamToNamed('/profile');
                            }
                          : () {
                              loginDialog(context);
                            },
                      style:
                          TextButton.styleFrom(foregroundColor: Palette.orange),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            CookingIcons.login,
                            width: 38,
                            height: 38,
                          ),
                          const SizedBox(width: 14),
                          Text(
                            auth.isAuth
                                ? 'Привет, ${auth.userDetail!.name}'
                                : 'Войти',
                            style: Theme.of(context)
                                .textTheme
                                .b18
                                .copyWith(color: Palette.orange),
                          ),
                        ],
                      ),
                    ),
                    if (auth.isAuth)
                      const VerticalDivider(
                        color: Palette.orange,
                        thickness: 0.5,
                        indent: 10,
                        endIndent: 10,
                      ),
                    if (auth.isAuth)
                      IconButton(
                        onPressed: () {
                          unawaited(auth.logout());
                          context.beamToNamed('/');
                        },
                        splashRadius: 16,
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Palette.grey,
                          size: 18,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
