import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollToIndexDemoPage extends StatefulWidget {
  const ScrollToIndexDemoPage({Key? key}) : super(key: key);

  @override
  State<ScrollToIndexDemoPage> createState() => _ScrollToIndexDemoPageState();
}

class _ScrollToIndexDemoPageState extends State<ScrollToIndexDemoPage> {
  static const maxCount = 100;

  /// pub scroll_to_index 项目的 controller
  AutoScrollController? controller;

  final random = math.Random();

  final scrollDirection = Axis.vertical;

  late List<List<int>> randomList;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    randomList = List.generate(maxCount,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
      index: index,
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.topCenter,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue, width: 4),
            borderRadius: BorderRadius.circular(12)),
        child: Text('index: $index, height: $height'),
      ),
    );
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: controller!,
        index: index,
        child: child,
        highlightColor: Colors.red.withOpacity(0.1),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("ScrollToIndexDemoPage"),
      ),
      body: new Container(
        child: ListView(
          scrollDirection: scrollDirection,
          controller: controller,
          children: randomList.map<Widget>((data) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: _getRow(data[0], math.max(data[1].toDouble(), 50.0)),
            );
          }).toList(),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new TextButton(
          onPressed: () async {
            await controller!
                .scrollToIndex(13, preferPosition: AutoScrollPosition.begin);
            controller!.highlight(13);
          },
          child: new Text("Scroll to 13"),
        )
      ],
    );
  }
}
