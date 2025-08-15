import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_language_provider.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class ChosseLanguageWidget extends StatefulWidget {
  const ChosseLanguageWidget({super.key});

  @override
  State<ChosseLanguageWidget> createState() => _ChosseLanguageWidgetState();
}

class _ChosseLanguageWidgetState extends State<ChosseLanguageWidget> {
  AppLanguageProvider? languageProvider;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    languageProvider = Provider.of<AppLanguageProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * .02, horizontal: size.width * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.whiteColor)),
      child: GestureDetector(
        onTap: chosseLanguage,
        child: Row(
          children: [
            Text(
              languageProvider!.languageCode == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
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

  void chosseLanguage() {
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
                  languageProvider!.changeLanguage(newLanguage: 'en');
                },
                child: languageProvider!.languageCode == 'en'
                    ? Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.english,
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        AppLocalizations.of(context)!.english,
                        style: AppStyle.black16bold,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  languageProvider!.changeLanguage(newLanguage: 'ar');
                },
                child: languageProvider!.languageCode == 'ar'
                    ? Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.arabic,
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        AppLocalizations.of(context)!.arabic,
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
