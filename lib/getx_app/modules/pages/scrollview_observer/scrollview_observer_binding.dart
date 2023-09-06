import 'package:get/get.dart';

import 'scrollview_observer_logic.dart';

class ScrollviewObserverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollviewObserverLogic());
  }
}
