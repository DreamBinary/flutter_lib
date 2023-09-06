import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import 'pinch_zoom_logic.dart';

class PinchZoomPage extends StatelessWidget {
  const PinchZoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PinchZoomLogic>();
    final state = Get.find<PinchZoomLogic>().state;

    return Scaffold(
      body: ListView(
        children: [
          PinchZoom(
            resetDuration: const Duration(milliseconds: 100),
            maxScale: 2.5,
            child: Image.asset("assets/p1.jpg"),
          ),
          PinchZoom(
            resetDuration: const Duration(milliseconds: 100),
            maxScale: 2.5,
            child: Container(
              color: Colors.red,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
