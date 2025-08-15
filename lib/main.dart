import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/feature/home/home_screen.dart';
import 'package:news_app/feature/search/search_screen.dart';
import 'package:news_app/provider/app_language_provider.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/utils/app_route.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppLanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRoute,
      routes: {
        AppRoute.homeRoute: (context) => HomeScreen(),
        AppRoute.searchRoute: (context) => SearchScreen()
      },
      locale: Locale(languageProvider.languageCode),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darktheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
