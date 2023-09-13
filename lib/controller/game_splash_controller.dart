import 'package:flutter_build_compare_number/page/game_home.dart';
import 'package:get/get.dart';
class GameSplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((value){
      Get.off(()=>const HomeGame());
    });
  }
}