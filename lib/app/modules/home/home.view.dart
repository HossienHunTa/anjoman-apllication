import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anjoman/app/data/services/auth.service.dart';

import 'home.controller.dart';

class Home extends GetView<HomeController> {
  final AuthService _authService = Get.find();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('صفحه اصلی'),
          Image.network(
            _authService.user.value.avatarUrl,
            width: 100,
            height: 100,
          ),
          Obx(() => Text(
              'سلام \n ایمیل شما : ${_authService.user.value.email}\n رمز شما : ${_authService.user.value.password}')),
          ElevatedButton(
            onPressed: () {
              _authService.logout();
            },
            child: const Text('خروج'),
          ),
        ],
      )),
    );
  }
}
