import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_build_compare_number/constant/themoreless_subtitle.dart';
import 'package:flutter_build_compare_number/helper/game_helper.dart';
import 'package:flutter_build_compare_number/widget/game_message.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
class GamePageController extends GetxController with WidgetsBindingObserver {
RxList listBetOption=[
  "ODD",
  "<",
  "=",
  ">",
  "EVEN"
].obs;
RxList listBetMultiplier=[
  1.92,
  1.77,
  96,
  2.13,
  1.92
].obs;
RxInt rightNumber=0.obs;
RxInt leftNumber=0.obs;
RxInt timeStop=0.obs;
RxInt gameWin=0.obs;
RxString symbol="".obs;
RxInt tapOnly=0.obs;
RxBool ismusic=true.obs;
RxBool isWin=false.obs;
RxDouble balance=(100000.00).obs;
RxDouble betAmount=(1.00).obs;
RxDouble winningAmount=(0.00).obs;
AudioPlayer musicPlay = AudioPlayer();
void buttonResetGame(){
  GameHelper.setBalance(100000);
  balance.value=100000;
  update();
}
void betButton({required int indexBet}){
  switch(indexBet){
    case 1:{ // Min
      betAmount.value=1;
    }break;
    case 2:{ // -
      if(betAmount.value>=2 && betAmount.value<=5){
        betAmount.value--;
      }else
        if(betAmount.value==10){
          betAmount.value=5;
        }else if(betAmount.value>10 && betAmount.value<=50){
          betAmount.value-=10;
        }else if(betAmount.value==70){
          betAmount.value=50;
        }else if(betAmount.value==100){
          betAmount.value=70;
        }else if(betAmount.value==200){
          betAmount.value=100;
        }
    }break;
    case 3:{ // +
      if(betAmount.value>=1 && betAmount.value<5){
        betAmount.value++;
      }else
        if(betAmount.value==5){
          betAmount.value=10;
        }else if(betAmount.value>=10 && betAmount.value<50){
          betAmount.value+=10;
        }else if(betAmount.value==50){
          betAmount.value=70;
        }else if(betAmount.value==70){
          betAmount.value=100;
        }else if(betAmount.value==100){
          betAmount.value=200;
        }
    }break;
    case 4:{ // Max
      betAmount.value=200;
    }break;
  }
}
int getRandomNumber(){
  return Random().nextInt(100)+1;
}
void timeRightNumberRandom(){
  Timer.periodic(const Duration(milliseconds: 10), (timer) { 
    timeStop++;
    if(timeStop.value==100){
      timer.cancel();
      timeStop.value=0;
    }else{
      rightNumber.value=getRandomNumber();
    }
    //debugPrint("timeStop: $timeStop");
  });
}
void totalWinAmount(int index){
  isWin.value=true;
  winningAmount.value=betAmount*listBetMultiplier[index];
  balance.value+=winningAmount.value;
  GameHelper.setBalance(balance.value);
  debugPrint("betAmount: $betAmount");
  debugPrint("listBetMultiplier[index]: ${listBetMultiplier[index]}");
  debugPrint("winningAmount: $winningAmount");
  update();
}
void checkNumberWin(){
  if(symbol.value=="ODD"){
    if(leftNumber%2!=0){
      totalWinAmount(0);
    }
  }
  if(symbol.value=="<"){
    if(leftNumber.value < rightNumber.value){
      totalWinAmount(1);
    }
  }
  if(symbol.value=="=="){
    if(leftNumber.value == rightNumber.value){
      totalWinAmount(2);
    }
  }
  if(symbol.value==">"){
    if(leftNumber.value > rightNumber.value){
      totalWinAmount(3);
    }
  }
  if(symbol.value=="EVEN"){
    if(leftNumber%2==0){
      totalWinAmount(4);
    }
  }
  if(isWin.value){
    gameWin.value=1;
  }else{
    gameWin.value=2;
  }
  update();
}
void timeLeftNumberRandom(){
  Timer.periodic(const Duration(milliseconds: 10), (timer) { 
    timeStop++;
    if(timeStop.value==100){
      timer.cancel();
      timeStop.value=0;
      checkNumberWin();
      Timer(const Duration(seconds: 4), () {
        isWin.value=false; 
        debugPrint("Time End");
        timeRightNumberRandom();
        symbol.value="";
        leftNumber.value=0;
        winningAmount.value=0;
        gameWin.value=0;
        update();
      });
      Timer(const Duration(seconds: 5), () { 
        tapOnly.value=0;
      });
    }else{
      leftNumber.value=getRandomNumber();
    }
  });
}
void tabLeftButton(String syn){
  tapOnly.value++;
  if(tapOnly.value==1){
    balance.value-=betAmount.value;
    if(balance.value>=0){
      symbol.value=syn;
      debugPrint("symbol: $symbol");
      update();
      timeLeftNumberRandom();
      update();
    }else{
      tapOnly.value=0;
      balance.value+=betAmount.value;
      // Have you not enought money
      showMessage(
        title: "OUT OF MONEY",
        message: "You have not enough money"
      );
    }
    
  }
}
void questionButton({required double height,required double width}){
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      height: height/2,
      width: width,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20)
        // ),
       // color: Colors.white,
        image:  DecorationImage(
          image: AssetImage(
            "assets/images/Table_01.png"
          ),
          fit: BoxFit.fill
        )
      ),
      child: ImageSlideshow(
        indicatorColor: Colors.amber,
        children: [
         ...List.generate(
          3, (index){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    title[index],
                    style:const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: width,
                    height: height/2*0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                    ),
                    child: Text(
                      subTitle[index],
                      style:const  TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    )
  );
}
Future<void> getPreferenceGame()async{
  GameHelper.getBalance().then((prefBalance){
    if(prefBalance==null){
      GameHelper.setBalance(100000);
      balance.value=100000;
    }else{
      balance.value=prefBalance;
    }
  });
}
void gameMusic(){
     ismusic.value=!ismusic.value;
    if(ismusic.value){
      musicPlay..play(AssetSource('music.mp3'),)
      ..setReleaseMode(ReleaseMode.loop);
    }else{
      musicPlay..stop()..setReleaseMode(ReleaseMode.stop);
    }
    update();
  }@override
  void onInit() {
     WidgetsBinding.instance.addObserver(this);
    musicPlay..play(AssetSource('music.mp3'),)
      ..setReleaseMode(ReleaseMode.loop);
    getPreferenceGame();
    timeRightNumberRandom();
    super.onInit();
  }

 @override
  void dispose() {
    super.dispose();
    musicPlay..stop()..setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
      musicPlay..pause()..setReleaseMode(ReleaseMode.stop);
      update();
    }
    if(state == AppLifecycleState.resumed){
        musicPlay..play(AssetSource('music.mp3'))
        ..setReleaseMode(ReleaseMode.loop);
        update();
    }
  }  
}