import 'package:get/get.dart';

import 'pinch_zoom_logic.dart';

class PinchZoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinchZoomLogic());
  }
}
