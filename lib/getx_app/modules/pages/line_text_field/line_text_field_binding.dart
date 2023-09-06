import 'package:get/get.dart';

import 'line_text_field_logic.dart';

class LineTextFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LineTextFieldLogic());
  }
}
