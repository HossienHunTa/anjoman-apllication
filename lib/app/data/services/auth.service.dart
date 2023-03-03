import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:anjoman/routes/pages.dart';
import 'package:anjoman/app/data/models/user.model.dart' as modelUser;

class AuthService extends GetxService {
  final supabase = Supabase.instance.client;
  final isLogged = false.obs;
  final user = modelUser.User().obs;
  bool get isLoggedValue => isLogged.value;

  signUp({required String email, required String password}) async {
    try {
      var res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      user.value.email = supabase.auth.currentSession!.user.email!;
      user.value.password = password;
      Get.snackbar('پاسخ', 'ثبت نام شما با موفقیت انجام شد');
      isLogged.value = true;
      Get.offAllNamed(Routes.signIn);
    } on AuthException catch (e) {
      Get.snackbar(e.statusCode.toString(), e.message);
    }
  }

  login({required String email, required String password}) async {
    try {
      var res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      user.value.email = supabase.auth.currentSession!.user.email!;
      user.value.password = password;
      Get.snackbar('پاسخ', 'شما وارد برنامه شدید');
      isLogged.value = true;
      Get.offAllNamed(Routes.home);
    } on AuthException catch (e) {
      Get.snackbar(e.statusCode.toString(), e.message);
    }
  }

  logout() {
    Supabase.instance.client.auth.signOut();
    isLogged.value = false;
    Get.offAllNamed(Routes.signIn);
  }
}
