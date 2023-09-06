import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all/getx_app/routes/app_pages.dart';

import 'main_logic.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  final data = [
    Routes.panorama,
    Routes.typeAhead,
    Routes.scrollviewObserver,
    Routes.lottie,
    Routes.spring,
    Routes.printing,
    Routes.pinchZoom,
    Routes.torch,
    Routes.lineTextField,
    Routes.showcaseView,
    Routes.objectDetection,
    Routes.flutterAndroid
  ]..sort();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP"),
      ),
      body: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListRow(
            title: data[index],
            onTap: () {
              Get.toNamed(data[index]);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MainLogic>();
    super.dispose();
  }
}

class ListRow extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  const ListRow({required this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        title[1].toUpperCase() + title.substring(2),
        style: const TextStyle(fontSize: 20),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
