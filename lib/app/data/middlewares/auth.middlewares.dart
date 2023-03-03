// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:anjoman/routes/pages.dart';
import 'package:anjoman/app/data/services/auth.service.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!_authService.isLoggedValue) {
      return const RouteSettings(name: Routes.signIn);
    }
    return null;
  }
}
