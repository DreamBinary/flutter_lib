import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import 'showcase_view_logic.dart';

class ShowcaseViewPage extends StatelessWidget {
  const ShowcaseViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ShowcaseViewLogic>();
    final state = Get.find<ShowcaseViewLogic>().state;

    return ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        log('onComplete: $index, $key');
        if (index == 4) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          );
        }
      },
      enableAutoScroll: true,
      blurValue: 10,
      builder: Builder(builder: (context) => const ShowWidget()),
      autoPlayDelay: const Duration(seconds: 3),
    );
  }
}

class ShowWidget extends StatefulWidget {
  const ShowWidget({Key? key}) : super(key: key);

  @override
  State<ShowWidget> createState() => _ShowWidgetState();
}

class _ShowWidgetState extends State<ShowWidget> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    //NOTE: remove ambiguate function if you are using
    //flutter version greater than 3.x and direct use WidgetsBinding.instance
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)
          .startShowCase([_one, _two, _three, _four, _five]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Showcase(
              key: _one,
              title: 'Title One',
              titleAlignment: TextAlign.center,
              description: 'Description One',
              descriptionAlignment: TextAlign.center,
              overlayColor: Colors.pink,
              overlayOpacity: 0.5,
              targetBorderRadius: BorderRadius.circular(100),
              child: Container(
                key: _one,
                height: 200,
                color: Colors.red,
                child: const Center(
                  child: Text('1'),
                ),
              ),
            ),
            Showcase.withWidget(
              key: _two,
              container: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text('2'),
                ),
              ),
              height: 50,
              width: 50,
              child: Container(
                key: _two,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text('2'),
                ),
              ),
            ),
            Showcase(
              key: _three,
              title: 'Title Three',
              description: 'Description Three',
              child: Container(
                key: _three,
                height: 200,
                color: Colors.green,
                child: const Center(
                  child: Text('3'),
                ),
              ),
            ),
            Showcase(
              key: _four,
              title: 'Title Four',
              description: 'Description Four',
              child: Container(
                key: _four,
                height: 200,
                color: Colors.yellow,
                child: const Center(
                  child: Text('4'),
                ),
              ),
            ),
            Showcase(
              key: _five,
              title: 'Title Five',
              description: 'Description Five',
              child: Container(
                key: _five,
                height: 200,
                color: Colors.purple,
                child: const Center(
                  child: Text('5'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowCaseWidget.of(context)
              .startShowCase([_one, _two, _four, _five, _three]);
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
