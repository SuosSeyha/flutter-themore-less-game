import 'package:flutter/material.dart';
import 'package:flutter_build_compare_number/constant/app_constant.dart';
import 'package:flutter_build_compare_number/controller/gamepage_controller.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// ignore: must_be_immutable
class GamePage extends StatelessWidget {
  GamePage({super.key});
  GamePageController controller = Get.put(GamePageController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
     // appBar: appAppStyle(),
     // drawer: const Drawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            width: width,
            //color: Colors.black12,
            decoration: const BoxDecoration(
             image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.jpg"
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
           // height: height*0.8,
            width: width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //scolor: mainColor,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/Table_01.png"
                ),
                fit: BoxFit.fill
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        controller.buttonResetGame();
                      },
                      
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                           image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Dot_01.png"
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                        child: const Icon(
                        Icons.restart_alt,
                        size: 30,
                        color: Colors.white,
                        
                      )
                      ),
                    ),
                    const SizedBox(width: 5,),
                    ZoomTapAnimation(
                      onTap: () {
                         controller.gameMusic();
                      },
                      
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                           image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Dot_01.png"
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                        child:   Obx(() =>  Icon(
                        controller.ismusic.value?Icons.volume_up:
                        Icons.volume_off,
                        size: 30,
                        color: Colors.white,
                        
                      ),)
                      ),
                    ),
                    //=
                    // ZoomTapAnimation(
                    //   onTap: () {
                    //     controller.gameMusic();
                    //   },
                    //   child: Obx(() =>  Icon(
                    //     controller.ismusic.value?Icons.volume_up:
                    //     Icons.volume_off,
                    //     size: 30,
                    //     color: Colors.white,
                        
                    //   ),)
                    // ),
                    const SizedBox(width: 5,),
                    ZoomTapAnimation(
                      onTap: () {
                         controller.questionButton(
                          height: height,
                          width: width
                        );
                      },
                      
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                           image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Dot_01.png"
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                        child: const Icon(
                        Icons.question_mark,
                        size: 30,
                        color: Colors.white,
                        
                      )
                      ),
                    ),
                    //=
                    // ZoomTapAnimation(
                    //   onTap: () {
                    //     controller.questionButton(
                    //       height: height,
                    //       width: width
                    //     );
                    //   },
                    //   child: const Icon(
                    //     Icons.help,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    // ),
                    const SizedBox(width: 10,),
                  ],
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  height: height*0.8/13,
                  width: width*0.8/1.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   // color: subColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/Table.png"
                      ),
                      fit: BoxFit.fill
                    )
                  ),
                  child:  Obx(() => FittedBox(
                    child: Text(
                      "${controller.balance.value.toStringAsFixed(2)}K",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ThemoreFont"
                      ),
                    ),
                  ),)
                ),
                SizedBox(
                  height: height*0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: height*0.8/5,
                      width: width*0.8/4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: subColor,
                        image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Table_01.png"
                        ),
                        fit: BoxFit.fill
                      )
                      ),
                      child: Obx(() => FittedBox(
                        child: Text(
                          controller.leftNumber.value==0?"?":
                          controller.leftNumber.value.toString(),
                          style: const TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ThemoreFont"
                          ),
                        ),
                      ),),
                    ),
                    GetBuilder(
                      init: GamePageController(),
                      builder: (controller) {
                        return Container(
                      alignment: Alignment.center,
                      height: height*0.8/7.5,
                      width: width*0.8/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: subColor,
                        image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Table_03.png"
                        ),
                        fit: BoxFit.fill
                      ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2,2),
                            color: controller.isWin.value?Colors.green:Colors.transparent,
                            blurRadius: 8
                          ),
                          BoxShadow(
                            offset: const Offset(-2,-2),
                            color: controller.isWin.value?Colors.green:Colors.transparent,
                            blurRadius: 8
                          )
                        ]
                      ),
                      child: Text(
                        controller.symbol.value==""?"":
                        controller.symbol.value,
                        style: const  TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ThemoreFont"
                        ),
                      )
                    );
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height*0.8/5,
                      width: width*0.8/4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: subColor,
                        image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Table_01.png"
                        ),
                        fit: BoxFit.fill
                      )
                      ),
                      child: Obx(() => FittedBox(
                        child: Text(
                          controller.rightNumber.value.toString(),
                          style: const TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ThemoreFont"
                          ),
                        ),
                      ),)
                    )
                  ],
                 ),
                SizedBox(
                  height: height*0.04,
                ),
                Obx(() => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5
                  ),
                  height: height/2*0.1,
                  width: width*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10
                    ),
                   // color: subColor
                  ),
                  child:  FittedBox(
                    child:  Text(
                      controller.gameWin.value==0?"CHOOSE YOUR OPTION":
                      controller.gameWin.value==1?"WINNING AMOUNT: ${controller.winningAmount.value.toString()}K":
                      "GAME LOSE",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ThemoreFont"
                      ),
                    ),
                  ),
                ),),
                SizedBox(
                  height: height*0.04,
                ),
                Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(controller.listBetOption.length, (index){
                    return Column(
                      children: [
                        ZoomTapAnimation(
                          onTap: () {
                            controller.tabLeftButton(controller.listBetOption[index]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(1),
                            height: height*0.8/10,
                            width: width*0.8/6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.white,
                            image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                            ),
                            child: Text(
                              controller.listBetOption[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ThemoreFont"
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          //height: height*0.8/10,
                          width: width*0.8/6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child:  Text(
                            "x${controller.listBetMultiplier[index]}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ThemoreFont"
                              ),
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),),
                SizedBox(
                  height: height*0.03,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        controller.betButton(indexBet: 1);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 5,
                        ),
                        alignment: Alignment.center,
                        height: height*0.8/14,
                        width: width*0.8/7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                         // color: subColor,
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: const Text(
                          "MIN",
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ThemoreFont"
                            ),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        controller.betButton(indexBet: 2);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 5,
                        ),
                        alignment: Alignment.center,
                         height: height*0.8/14,
                        width: width*0.8/7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          //color: subColor,
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: height*0.8/12,
                          width: width*0.8/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: subColor,
                            image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                          ),
                          child: Obx(() => FittedBox(
                            child:  Text(
                              "${controller.betAmount.value.toString()}K",
                              style:const  TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ThemoreFont"
                              ),
                            ),
                          ))
                        ),
                        FittedBox(
                          child: Container(
                            alignment: Alignment.center,
                           // height: height*0.8/12,
                            width: width*0.8/2.5,
                            decoration: const BoxDecoration(
                              //borderRadius: BorderRadius.circular(10),
                            //  color: Colors.amber
                          //   image: DecorationImage(
                          //   image: AssetImage(
                          //     "assets/images/Table_03.png"
                          //   ),
                          //   fit: BoxFit.fill
                          // )
                            ),
                            child: const Text(
                              "MIN 1K - MAX 200K",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "ThemoreFont"
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        controller.betButton(indexBet: 3);
                      },
                      child: Container(margin: const EdgeInsets.only(
                          right: 5,
                          left: 5
                        ),
                        alignment: Alignment.center,
                         height: height*0.8/14,
                        width: width*0.8/7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          //color: subColor
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        controller.betButton(indexBet: 4);
                      },
                      child: Container(
                        alignment: Alignment.center,
                         height: height*0.8/14,
                        width: width*0.8/7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          //color: subColor
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/Table_03.png"
                            ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: const Text(
                          "MAX",
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ThemoreFont"
                            ),
                        ),
                      ),
                    ),
                  ],
                 )
                ],
              ),
            )
          )
        ],
      ),
    );
    
  }
}