import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class ChosseThemeWidget extends StatefulWidget {
  const ChosseThemeWidget({super.key});

  @override
  State<ChosseThemeWidget> createState() => _ChosseThemeWidgetState();
}

class _ChosseThemeWidgetState extends State<ChosseThemeWidget> {
  AppThemeProvider? themeprovider;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    themeprovider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * .02, horizontal: size.width * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.whiteColor)),
      child: GestureDetector(
        onTap: chosseMode,
        child: Row(
          children: [
            Text(
              themeprovider!.appTheme == ThemeMode.dark
                  ? AppLocalizations.of(context)!.dark
                  : AppLocalizations.of(context)!.light,
              style: AppStyle.white16bold,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_downward_outlined,
              color: AppColor.whiteColor,
            )
          ],
        ),
      ),
    );
  }

  void chosseMode() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  themeprovider!.changeTheme(newTheme: ThemeMode.dark);
                },
                child: themeprovider!.appTheme == ThemeMode.dark
                    ? Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dark,
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        AppLocalizations.of(context)!.dark,
                        style: AppStyle.black16bold,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  themeprovider!.changeTheme(newTheme: ThemeMode.light);
                },
                child: themeprovider!.appTheme == ThemeMode.light
                    ? Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.light,
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        AppLocalizations.of(context)!.light,
                        style: AppStyle.black16bold,
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
