import 'package:get/get.dart';

import 'print_logic.dart';

class PrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrintLogic());
  }
}
