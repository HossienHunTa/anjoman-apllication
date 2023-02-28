import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Languages {
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('fa', 'IR'),
  ];
  static const locale = Locale('fa', 'IR');
  static const fallbackLocale = Locale('en', 'US');
}

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'fa_IR': {
          'hello': 'سلام دنیا',
        }
      };
}
