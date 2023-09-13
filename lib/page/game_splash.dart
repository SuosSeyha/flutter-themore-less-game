import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constant/app_constant.dart';
import '../controller/game_splash_controller.dart';
class GameSplash extends StatelessWidget {
   GameSplash({super.key});
   GameSplashController splashController = Get.put(GameSplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "The Moreless Game ",
              style: TextStyle(
                color: subColor,
                fontSize: 25
              ),
            ),
            LoadingAnimationWidget.fourRotatingDots(
            color: subColor,
            size: 50,
            ),
          ],
        ),
      ),
    );
  }
}