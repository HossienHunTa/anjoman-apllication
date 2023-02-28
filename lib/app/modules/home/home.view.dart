// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.isLogged.value) {
      Get.offAllNamed('/signIn');
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('HomePage')),
      );
    }
  }
}
