// ignore_for_file: non_constant_identifier_names

part of 'pages.dart';

abstract class Routes {
  static const home = _Paths.home;
  static const signIn = _Paths.signIn;
  static const signUp = _Paths.signUp;
  static const splash = _Paths.splash;

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$signIn?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const home = '/';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const splash = '/splash';
}
