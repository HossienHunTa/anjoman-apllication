// ignore_for_file: non_constant_identifier_names

// Package>flutter lib
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Package>pub lib
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Package>Anjoman>constants
import 'package:anjoman/Views/components/constants.dart';
// Package>Anjoman>Pages
import 'package:anjoman/Views/home.view.dart';
import 'package:anjoman/Views/signIn.view.dart';
import 'package:anjoman/Views/signUp.view.dart';
import 'package:anjoman/Views/NotFound.view.dart';
import 'package:anjoman/Views/splash-screen.view.dart';
// Package>Anjoman>Controller
import 'package:anjoman/Controllers/app.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Access Service and Storage Data
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Supabase.initialize(
    url: dotenv.get('URL'),
    anonKey: dotenv.get('ANONKEY'),
  );
  final ApplicationSetting = GetStorage('ApplicationSetting');
  (!ApplicationSetting.hasData('firstTime_Applaunch'))
      ? ApplicationSetting.write('firstTime_Applaunch', true)
      : ApplicationSetting.write('firstTime_Applaunch', false);
  ApplicationSetting.save();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ApplicationController applicationController =
    //     Get.put(ApplicationController());
    return GetMaterialApp(
        //Config Application
        title: 'انجمن',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Mitra',
            primaryColor: MyColors.miloOrange,
            scaffoldBackgroundColor: MyColors.willowSky,
            brightness: Brightness.light,
            buttonTheme: const ButtonThemeData(
              buttonColor: MyColors.sweetOrange,
              disabledColor: MyColors.karBlue,
            )),
        darkTheme: ThemeData(
            fontFamily: 'Mitra',
            primaryColor: MyColors.miloOrange,
            scaffoldBackgroundColor: MyColors.stormyBrew,
            brightness: Brightness.dark,
            buttonTheme: const ButtonThemeData(
              buttonColor: MyColors.darkLightBlue,
              disabledColor: MyColors.karBlue,
            )),
        themeMode: ThemeMode.dark,
        defaultTransition: Transition.circularReveal,
        //Config locale
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('fa', 'IR'),
        ],
        locale: const Locale('fa', 'IR'),
        fallbackLocale: const Locale('en', 'US'),
        translations: Translate(),
        //Config Route
        unknownRoute: GetPage(name: '/404', page: () => const NotFoundPage()),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(name: '/signIn', page: () => const SignInPage()),
          GetPage(name: '/signUp', page: () => const SignUpPage()),
          GetPage(name: '/splash', page: () => const SplashScreen()),
          // GetPage(name:'/', page:() => ),
          // GetPage(name:'/', page:() => ),
        ]);
  }
}
