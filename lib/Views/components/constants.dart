import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  MyColors._();
  static const Color transparent = Color(0x00000000);
  static const Color darkAzovBlue = Color(0xff253990);
  static const Color karBlue = Color(0xff2F4858);
  static const Color stormyBrew = Color(0xff17313D);
  static const Color darkLightBlue = Color(0xff6A54FB);
  static const Color miloBlue = Color(0xffA0CAFF);
  static const Color willowSky = Color(0xffB0E6FF);
  static const Color caliBeachBlue = Color(0xff00BBBB);
  static const Color miloOrange = Color(0xffFBB344);
  static const Color sweetOrange = Color(0xffF9B460);
  static const Color korlen = Color(0xffFBA744);
  static const Color bananaYellow = Color(0xffFBF044);
  static const Color miloYellow = Color(0xffF9F871);
  static const Color whiteyDilin = Color(0xffB8E067);
}

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'fa_IR': {
          'hello': 'سلام دنیا',
        }
      };
}
