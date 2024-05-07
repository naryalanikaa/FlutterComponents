
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {

  static void showMessage(String title, String message) {
    Get.snackbar(title, message,
        margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.TOP,
        colorText: AppColors.white,
        backgroundColor: AppColors.primary);
  }


  static void showTopMessage(String title, String message) {
    Get.snackbar(title, message,
        margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        colorText: AppColors.white,
        backgroundColor: AppColors.primary);
  }
}
