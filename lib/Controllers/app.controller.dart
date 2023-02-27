import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final isFa = true.obs;
  final darkMode = true.obs;
  final isLogged = false.obs;

  changeLang() {
    isFa.toggle();
    Get.updateLocale(
        isFa.value ? const Locale('fa', 'IR') : const Locale('en', 'US'));
  }

  changeTheme() {
    darkMode.toggle();
    Get.changeThemeMode(darkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  isUserLogged() {
    if (!isLogged.value) {
    } else {
      return false;
    }
  }
}
