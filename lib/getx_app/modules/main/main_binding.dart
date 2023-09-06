import 'package:get/get.dart';
import 'package:all/getx_app/modules/pages/panorama/panorama_logic.dart';

import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => PanoramaLogic());
  }
}
