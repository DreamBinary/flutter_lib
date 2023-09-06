import 'package:get/get.dart';

import 'panorama_logic.dart';

class PanoramaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanoramaLogic());
  }
}
