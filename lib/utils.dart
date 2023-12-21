import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbarError(String message) {
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    borderRadius: 15.0,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOut,
    reverseAnimationCurve: Curves.easeIn,
  );
}
