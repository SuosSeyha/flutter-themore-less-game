import 'package:flutter/material.dart';
import 'package:flutter_build_compare_number/page/game_page.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../constant/app_constant.dart';
class HomeGame extends StatelessWidget {
  const HomeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/home.jpg"
            ),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomTapAnimation(
              onTap: () {
                Get.off(()=>GamePage());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 3
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/2 * 0.13,
                width: MediaQuery.of(context).size.width/2 * 0.9,
                decoration: BoxDecoration(
                  //color: subColor,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Table.png"
                        ),
                        fit: BoxFit.fill
                      ),
                ),
                child: const FittedBox(
                  child: Text(
                    "START GAME",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}