import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghaselk/repos/auth_repo.dart';
import 'package:ghaselk/repos/lang_repo.dart';
import 'package:ghaselk/screens/Client/client_home_page.dart';

import 'package:ghaselk/widgets/first_stepper/base_stepper.dart';
import 'package:ghaselk/widgets/slider_layout_view.dart';

import 'package:provider/provider.dart';
import 'package:ghaselk/todos.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations_delegate.dart';
import 'package:ghaselk/utils/locales/appliction.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: statusBarBlue));

  runApp(DevicePreview(
    enabled: 0 == 5,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  void initState() {
    application.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale('ar', 'ar'));

    LangRepo().getLocaleCode().then((code) {
      setState(() {
        _newLocaleDelegate =
            AppTranslationsDelegate(newLocale: Locale(code, code));
      });
    });
    // AuthRepo().signOut();
    // LangRepo().setLocale(locale: locales.en);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PushNotificationService().initialise();
    // print(_newLocaleDelegate.newLocale.languageCode);
    if (todos.length > 0) print(' you still have more todos');
    return Directionality(
        textDirection: _newLocaleDelegate.newLocale.languageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: AuthRepo()),
              ChangeNotifierProvider.value(value: Counter()),
            ],
            child: Consumer<AuthRepo>(
              builder: (ctx, auth, _) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  supportedLocales: application.supportedLocales(),
                  localizationsDelegates: [
                    _newLocaleDelegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  locale: _newLocaleDelegate.newLocale,
                  routes: <String, WidgetBuilder>{
                    '/client': (ctx) => ClientHome()
                  },
                  home: SliderLayoutView(),
                  title: 'تاج',
                  theme: ThemeData(fontFamily: 'Cairo')),
            )));
  }
}
