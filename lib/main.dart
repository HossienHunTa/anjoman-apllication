// ignore_for_file: non_constant_identifier_names

// Package>flutter lib
import 'package:anjoman/app/data/services/auth.service.dart';
import 'package:flutter/material.dart';
// Package>pub lib
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Package>Anjoman>Core
import 'package:anjoman/core/languages.dart';
import 'package:anjoman/core/themes.dart';
import 'package:anjoman/core/consts.dart';
// Package>Anjoman>routes>Pages
import 'package:anjoman/routes/pages.dart';
// Package>Anjoman>app>data>service

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  final ApplicationSetting = GetStorage('ApplicationSetting');
  (!ApplicationSetting.hasData('firstTime_Applaunch'))
      ? ApplicationSetting.write('firstTime_Applaunch', true)
      : ApplicationSetting.write('firstTime_Applaunch', false);
  ApplicationSetting.save();
  runApp(
    GetMaterialApp(
      title: 'انجمن',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.circularReveal,
      localizationsDelegates: Languages.localizationsDelegates,
      supportedLocales: Languages.supportedLocales,
      locale: Languages.locale,
      fallbackLocale: Languages.fallbackLocale,
      translations: Translate(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      unknownRoute: AppPages.unknownRoute,
    ),
  );
}

Future<void> initializeApp() async {
  //Access Service and Storage Data
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Supabase.initialize(
    url: dotenv.get('URL'),
    anonKey: dotenv.get('ANONKEY'),
  );
  AuthService _authService = Get.put(AuthService());
  Get.log('Initialize');
}
