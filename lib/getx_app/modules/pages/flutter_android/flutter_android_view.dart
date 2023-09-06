import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:all/getx_app/utils/toast.dart';

import 'flutter_android_logic.dart';

class FlutterAndroidPage extends StatefulWidget {
  const FlutterAndroidPage({Key? key}) : super(key: key);

  @override
  State<FlutterAndroidPage> createState() => _FlutterAndroidPageState();
}

class _FlutterAndroidPageState extends State<FlutterAndroidPage> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FlutterAndroidLogic>();
    final state = Get.find<FlutterAndroidLogic>().state;
    //MethodChannel   channelName一致
    const platform = MethodChannel('channelName');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              var k = await platform.invokeMethod("openAndroidPage");
              ToastUtil.showToast(k.toString());
            } catch (e) {
              ToastUtil.showToast("出现错误");
            }
          },
          child: const Text("to Android Page"),
        ),
      ),
    );
  }
}
