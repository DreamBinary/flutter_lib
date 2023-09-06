import 'package:get/get.dart';

import 'spring_logic.dart';

class SpringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpringLogic());
  }
}
