import 'package:flutter/material.dart';
import 'package:flutter_day2/TabBarWidget.dart';
import 'package:flutter_day2/TabBarPageFirst.dart';
import 'package:flutter_day2/TabBarPageSecond.dart';
import 'package:flutter_day2/TabBarPageThird.dart';

class TabBarTopWidget extends StatefulWidget {
  
  @override 
  _TabBarTopWidget createState() => _TabBarTopWidget();
}

class _TabBarTopWidget extends State<TabBarTopWidget> {
  
  final PageController topPageController =PageController();
  final List<String> tabs = ["动态", "趋势", "我的"];

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: TabBarWidget.TOP_TAB,
      tabItems: renderItems(),
      tabViews: renderViews(),
      topPageController: topPageController,
    );
  }

  renderItems() {
    List<Widget> list = List();
    for (var i = 0; i < tabs.length; i++) {
      list.add(
        FlatButton(
          onPressed: () {
            topPageController.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: Text(
            tabs[i],
            maxLines: 1,
          ),
        )
      );
    }
    return list;
  }

  renderViews() {
    return [
      TabBarPageFirst(),
      TabBarPageSecond(),
      TabBarPageThird()
    ];
  }
}