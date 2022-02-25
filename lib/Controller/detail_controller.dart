import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxInt fav = 0.obs;

  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("Loved it", "You Already Loved It");
    } else {
      fav.value++;
      Get.snackbar("Loved it", "You Just Loved It");
    }
  }
}
