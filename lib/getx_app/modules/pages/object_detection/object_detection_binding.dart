import 'package:get/get.dart';

import 'object_detection_logic.dart';

class ObjectDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ObjectDetectionLogic());
  }
}
