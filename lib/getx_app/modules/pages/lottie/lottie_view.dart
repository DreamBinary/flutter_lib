import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'lottie_logic.dart';

class LottiePage extends StatelessWidget {
  const LottiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LottieLogic>();
    final state = Get.find<LottieLogic>().state;

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Lottie.asset("assets/lottie/refresh.json"),
            Lottie.network(
                "https://rawgit.flutter-io.cn/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json"),
          ],
        ),
      ),
    );
  }
}
