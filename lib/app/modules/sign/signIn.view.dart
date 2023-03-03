import 'package:anjoman/app/modules/sign/signIn.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anjoman/app/data/services/auth.service.dart';

class SignIn extends GetView<SignInController> {
  final AuthService _authService = Get.find();
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('صفحه ورود'),
          Obx(() => Text('وضعیت ورود : ${_authService.isLoggedValue}')),
          ElevatedButton(
            onPressed: () {
              _authService.login(
                  email: 'hossien021.m@yahoo.com', password: '12345678');
            },
            child: const Text('وورد'),
          ),
          ElevatedButton(
            onPressed: () {
              _authService.signUp(
                  email: 'hossien021.m@gmail.com', password: '12345678');
            },
            child: const Text('ثبت نام'),
          ),
        ],
      )),
    );
  }
}
