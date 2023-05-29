import 'package:digital_currency/Provider/CryptoDataProvider.dart';
import 'package:digital_currency/Provider/ThemeProvider.dart';
import 'package:digital_currency/Ui/MainWrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  void main() {
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CryptoDataProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeprovider, child) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("en"),
          themeMode: themeprovider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        );
      }),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text("ExChangeBs"),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: ThemeSwitcher(),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: MainWrapper(),
      ),
    );
  }
}
