import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 滑动到指定位置 GlobalKey版本
/// 基于SingleChildScrollView 和 Colum

class ScrollToIndexDemoPage2 extends StatefulWidget {
  const ScrollToIndexDemoPage2({Key? key}) : super(key: key);

  @override
  State<ScrollToIndexDemoPage2> createState() => _ScrollToIndexDemoPage2State();
}

class _ScrollToIndexDemoPage2State extends State<ScrollToIndexDemoPage2> {
  GlobalKey scrollKey = GlobalKey();

  ScrollController controller = new ScrollController();

  List<ItemModel> dataList = [];

  @override
  void initState() {
    super.initState();
    dataList.clear();            
    for (int i = 0; i < 100; i++) {
      dataList.add(new ItemModel(i));
    }
  }

  _scrollToIndex() {
    var key = dataList[12];

    /// 获取renderBox
    RenderBox renderBox =
        key.globalKey.currentContext!.findRenderObject() as RenderBox;

    /// 获取位置偏移 基于 ancestor: SingleChildScrollView 的 RenderObject()
    double dy = renderBox
        .localToGlobal(Offset.zero,
            ancestor: scrollKey.currentContext!.findRenderObject())
        .dy;

    /// 计算真实位移
    var offset = dy + controller.offset;

    print("******$offset");

    controller.animateTo(offset,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("ScrollToIndexDemoPage2"),
      ),
      body: new Container(
        child: SingleChildScrollView(
          key: scrollKey,
          controller: controller,
          child: Column(
            children: dataList.map<Widget>((data) {
              return CardItem(data, key: dataList[data.index].globalKey);
            }).toList(),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new TextButton(
          onPressed: () async {
            _scrollToIndex();
          },
          child: new Text("Scroll to 12"),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final random = math.Random();

  final ItemModel data;

  CardItem(this.data, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Container(
        height: (300 * random.nextDouble() + 50),
        alignment: Alignment.centerLeft,
        child: new Container(
          margin: EdgeInsets.all(5),
          child: new Text("Item ${data.index}"),
        ),
      ),
    );
  }
}

class ItemModel {
  GlobalKey globalKey = new GlobalKey();

  final int index;

  ItemModel(this.index);
}
