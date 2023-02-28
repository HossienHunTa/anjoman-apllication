// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:get/get.dart';
import 'package:anjoman/app/modules/home/home.view.dart';
import 'package:anjoman/app/modules/sign/signIn.view.dart';
import 'package:anjoman/app/modules/sign/signUp.view.dart';
import 'package:anjoman/app/modules/splash/splash-screen.view.dart';
import 'package:anjoman/app/modules/404/notFound.view.dart';

part 'routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;
  static final unknownRoute =
      GetPage(name: '/404', page: () => const NotFoundPage());
  static final routes = [
    GetPage(
        name: '/',
        page: () => const HomePage(),
        bindings: [],
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
            middlewares: const [
              // EnsureNotAuthedMiddleware(),
            ],
            name: _Paths.signIn,
            page: () => const SignInPage(),
            bindings: [],
          ),
          GetPage(
            name: _Paths.home,
            page: () => const HomePage(),
            preventDuplicates: true,
            bindings: [
              // HomeBinding(),
            ],
          ),
          GetPage(name: '/signIn', page: () => const SignInPage()),
          GetPage(name: '/signUp', page: () => const SignUpPage()),
          GetPage(name: '/splash', page: () => const SplashScreen()),
        ]),
  ];
}
