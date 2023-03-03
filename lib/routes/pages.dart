// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:get/get.dart';
// Views
import 'package:anjoman/app/modules/home/home.view.dart';
import 'package:anjoman/app/modules/sign/signIn.view.dart';
import 'package:anjoman/app/modules/sign/signUp.view.dart';
import 'package:anjoman/app/modules/splash/splash.view.dart';
import 'package:anjoman/app/modules/404/notFound.view.dart';
// Binding
import 'package:anjoman/app/modules/home/home.binding.dart';
import 'package:anjoman/app/modules/sign/signIn.binding.dart';
// Middleware
import 'package:anjoman/app/data/middlewares/auth.middlewares.dart';

part 'routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;
  static final unknownRoute =
      GetPage(name: Routes.notFoundPage, page: () => const NotFoundPage());
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => Home(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignIn(),
      binding: SignInBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
  ];
}
