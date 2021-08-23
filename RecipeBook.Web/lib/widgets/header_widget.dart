import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/login_dialog.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key, this.currentSelectedPage}) : super(key: key);

  final HeaderButtons? currentSelectedPage;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late ApiService apiService;
  late AuthNotifier authNotifier;

  @override
  void initState() {
    apiService = ApiService();
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if (!authNotifier.isAuth) {
      authNotifier.getCurrentUser();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authNotifier = Provider.of<AuthNotifier>(context); // чтоюы избранное появлялось после создания экрана
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 120, right: 120, top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Recipes",
              style: Theme.of(context).textTheme.b24.copyWith(color: Palette.orange),
            ),
            const SizedBox(width: 80),
            ...List.generate(
              !authNotifier.isAuth ? 2 : 3,
              (index) => TextButton(
                onPressed: () {
                  context.beamToNamed(HeaderButtons.getById(index).route);
                },
                style: TextButton.styleFrom(
                  primary: Palette.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    HeaderButtons.getById(index).name,
                        style: widget.currentSelectedPage?.index == index
                            ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                            : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey),
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
                      context.beamToNamed("/profile");
                    }
                        : () {
                      loginDialog(context);
                    },
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
                          auth.isAuth ? "Привет, ${auth.userDetail!.name}" : "Войти",
                          style: Theme.of(context).textTheme.b18.copyWith(color: Palette.orange),
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
                        auth.logout();
                        context.beamToNamed("/");
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
    );
  }
}
