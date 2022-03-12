import 'package:dukkantek_task/config/ui_config.dart';
import 'package:dukkantek_task/generated/l10n.dart';
import 'package:dukkantek_task/screens/login/ui/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppThemeApp _theme = AppThemeApp();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: _theme.appTheme(),
      home: ScreenUtilInit(
          designSize: const Size(1080, 1920), builder: () => const LoginPage()),
    );
  }
}
