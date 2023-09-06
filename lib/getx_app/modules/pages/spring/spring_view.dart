import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';

import 'spring_logic.dart';

class SpringPage extends StatelessWidget {
  const SpringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SpringLogic>();
    final state = Get.find<SpringLogic>().state;

    final springCtrl = SpringController(initialAnim: Motion.pause);

    return Scaffold(
      body: ListView(
        children: [
          Spring.pop(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.slide(
              springController: springCtrl,
              slideType: SlideType.slide_in_left,
              child: const FlutterLogo()),
          Spring.shake(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.blink(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.bubbleButton(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.flip(
            springController: springCtrl,
            frontWidget: const FlutterLogo(),
            rearWidget: const FlutterLogo(),
          ),
          Spring.fadeIn(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.fadeOut(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.opacity(
            springController: springCtrl,
            startOpacity: 1,
            endOpacity: 0,
            child: const FlutterLogo(),
          ),
          Spring.rotate(
            springController: springCtrl,
            child: const FlutterLogo(),
          ),
          Spring.scale(
            springController: springCtrl,
            start: 1,
            end: 2,
            child: const FlutterLogo(),
          ),
          Spring.translate(
            springController: springCtrl,
            beginOffset: const Offset(0, 0),
            endOffset: const Offset(100, 50),
            child: const FlutterLogo(),
          ),
          Spring.animatedCard(
            springController: springCtrl,
            fromWidth: 50,
            toWidth: 200,
            fromHeight: 50,
            toHeight: 200,
            child: const FlutterLogo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          springCtrl.play();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
