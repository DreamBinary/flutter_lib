import 'package:get/get.dart';
import 'package:all/getx_app/modules/main/main_binding.dart';
import 'package:all/getx_app/modules/main/main_view.dart';
import 'package:all/getx_app/modules/pages/flutter_android/flutter_android_binding.dart';
import 'package:all/getx_app/modules/pages/flutter_android/flutter_android_view.dart';
import 'package:all/getx_app/modules/pages/line_text_field/line_text_field_binding.dart';
import 'package:all/getx_app/modules/pages/line_text_field/line_text_field_view.dart';
import 'package:all/getx_app/modules/pages/lottie/lottie_binding.dart';
import 'package:all/getx_app/modules/pages/lottie/lottie_view.dart';
import 'package:all/getx_app/modules/pages/object_detection/object_detection_binding.dart';
import 'package:all/getx_app/modules/pages/object_detection/object_detection_view.dart';
import 'package:all/getx_app/modules/pages/panorama/panorama_binding.dart';
import 'package:all/getx_app/modules/pages/panorama/panorama_view.dart';
import 'package:all/getx_app/modules/pages/pinch_zoom/pinch_zoom_binding.dart';
import 'package:all/getx_app/modules/pages/pinch_zoom/pinch_zoom_view.dart';
import 'package:all/getx_app/modules/pages/print/print_binding.dart';
import 'package:all/getx_app/modules/pages/print/print_view.dart';
import 'package:all/getx_app/modules/pages/scrollview_observer/scrollview_observer_binding.dart';
import 'package:all/getx_app/modules/pages/scrollview_observer/scrollview_observer_view.dart';
import 'package:all/getx_app/modules/pages/showcase_view/showcase_view_binding.dart';
import 'package:all/getx_app/modules/pages/spring/spring_binding.dart';
import 'package:all/getx_app/modules/pages/spring/spring_view.dart';
import 'package:all/getx_app/modules/pages/torch/torch_binding.dart';
import 'package:all/getx_app/modules/pages/torch/torch_view.dart';
import 'package:all/getx_app/modules/pages/type_ahead/type_ahead_binding.dart';
import 'package:all/getx_app/modules/pages/type_ahead/type_ahead_view.dart';

import '../modules/pages/showcase_view/showcase_view_view.dart';
import '../modules/test/test_binding.dart';
import '../modules/test/test_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.test,
        page: () => const TestPage(),
        binding: TestBinding()),
    GetPage(
      name: Routes.main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.panorama,
      page: () => PanoramaPage(),
      binding: PanoramaBinding(),
    ),
    GetPage(
      name: Routes.typeAhead,
      page: () => TypeAheadPage(),
      binding: TypeAheadBinding(),
    ),
    GetPage(
      name: Routes.scrollviewObserver,
      page: () => ScrollviewObserverPage(),
      binding: ScrollviewObserverBinding(),
    ),
    GetPage(
      name: Routes.lottie,
      page: () => const LottiePage(),
      binding: LottieBinding(),
    ),
    GetPage(
      name: Routes.spring,
      page: () => const SpringPage(),
      binding: SpringBinding(),
    ),
    GetPage(
      name: Routes.printing,
      page: () => const PrintPage(),
      binding: PrintBinding(),
    ),
    GetPage(
      name: Routes.pinchZoom,
      page: () => const PinchZoomPage(),
      binding: PinchZoomBinding(),
    ),
    GetPage(
        name: Routes.torch, page: () => TorchPage(), binding: TorchBinding()),
    GetPage(
      name: Routes.lineTextField,
      page: () => LineTextFieldPage(),
      binding: LineTextFieldBinding(),
    ),
    GetPage(
        name: Routes.showcaseView,
        page: () => const ShowcaseViewPage(),
        binding: ShowcaseViewBinding()),
    GetPage(
        name: Routes.objectDetection,
        page: () => const ObjectDetectionPage(),
        binding: ObjectDetectionBinding()),
    GetPage(
        name: Routes.flutterAndroid,
        page: () => const FlutterAndroidPage(),
        binding: FlutterAndroidBinding())
  ];
}
