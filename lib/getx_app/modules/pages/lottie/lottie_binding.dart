import 'package:get/get.dart';

import 'lottie_logic.dart';

class LottieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LottieLogic());
  }
}
