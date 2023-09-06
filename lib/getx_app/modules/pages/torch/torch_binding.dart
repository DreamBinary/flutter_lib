import 'package:get/get.dart';

import 'torch_logic.dart';

class TorchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TorchLogic());
  }
}
