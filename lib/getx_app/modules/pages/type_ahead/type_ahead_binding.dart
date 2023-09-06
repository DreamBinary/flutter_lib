import 'package:get/get.dart';

import 'type_ahead_logic.dart';

class TypeAheadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeAheadLogic());
  }
}
