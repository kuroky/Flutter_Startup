import 'package:flutter/material.dart';
import 'package:flutter_day2/TabBarWidget.dart';
import 'package:flutter_day2/TabBarPageFirst.dart';
import 'package:flutter_day2/TabBarPageSecond.dart';
import 'package:flutter_day2/TabBarPageThird.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  final PageController topPageControl = PageController();
  final List<String> tab = ["动态", "趋势", "我的"];

  @override
  Widget build(BuildContext context) {
    // 带Scaffold的Tabbar页面
    return TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItems: renderTab(),
      tabViews: renderPage(),
      topPageController: topPageControl,
    );
  }

  // 设置tabbar item
  renderTab() {
    List<Widget> list = List();
    for (var i = 0; i < tab.length; i++) {
      list.add(FlatButton(
        onPressed: () {
          // 每个tabbar点击时，通过jumpTo跳转页面
          // 每个页面需要跳转坐标为：当前屏幕大小 * 索引index
          topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
        },
        child: Text(
          tab[i],
          maxLines: 1,
        ),
      ));
    }
    return list;
  }

  // 设置对应page
  renderPage() {
    return [
      TabBarPageFirst(), 
      TabBarPageSecond(), 
      TabBarPageThird()];
  }
}