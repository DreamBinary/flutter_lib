import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:all/getx_app/modules/main/main_binding.dart';
import 'package:all/getx_app/routes/app_pages.dart';

List<CameraDescription> cameras = [];

void main() async {
  runApp(const GetXApp());
  cameras = await availableCameras();
}

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      getPages: AppPages.pages,
      initialRoute: Routes.main,
      initialBinding: MainBinding(),
    );
  }
}
