import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage({required String title,required String message}){
  Get.snackbar(
    '', 
    '',
    titleText: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
    borderWidth: 1,
    borderColor: Colors.amber,
    overlayBlur: 2.0,
    backgroundGradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        Colors.black,
        Colors.amber
      ]
    ),
    backgroundColor: Colors.black.withOpacity(0.7),
    duration: const Duration(seconds: 3)
  );
}