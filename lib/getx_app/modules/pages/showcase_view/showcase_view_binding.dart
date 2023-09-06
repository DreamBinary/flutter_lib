import 'package:get/get.dart';

import 'showcase_view_logic.dart';

class ShowcaseViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowcaseViewLogic());
  }
}
