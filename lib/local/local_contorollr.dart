import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Melocalcontrollr extends GetxController {
  void changelung(String codelang) {
    Locale locales = Locale(codelang);
    Get.updateLocale(locales);
  }
}
