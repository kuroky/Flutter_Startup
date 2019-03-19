import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  TabBarWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.topPageController})
      : super(key: key);

  static const int BOTTOM_TAB = 1;
  static const int TOP_TAB = 2;

  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final PageController topPageController;

  @override
  _TabBarWidget createState() =>
      _TabBarWidget(type, tabItems, tabViews, topPageController);
}

class _TabBarWidget extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  _TabBarWidget(this.type, this.tabItems, this.tabViews, this.pageController)
      : super();

  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final PageController pageController;

  TabController tabController;

  @override
  void initState() {
    super.initState();
    // 初始化时创建控制器
    // 通过 with SingleTickerProviderStateMixin 实现动画效果
    tabController = TabController(vsync: this, length: tabItems.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.type == TabBarWidget.TOP_TAB) {
      return Scaffold(
        // 设置侧边划出
        drawer: null,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed: () {},
        ), 
        // 导航栏
        appBar: AppBar(
          title: Text("title"),
          bottom: TabBar(
            isScrollable: true, // 顶部时，tabBar为可以滑动的模式
            controller: tabController, // 必须有控制器，与pageView的控制器同步
            tabs: tabItems, // 对应的tabItems
            indicatorColor: Colors.blue,
          ),
        ),
        // 页面主体， pageView，用于承载Tab对应的页面
        body: PageView(
          controller: pageController, // 控制器，与tabBar的控制器同步
          children: tabViews, // 每个tab对应的页面主体
          onPageChanged: (index) {
            tabController.animateTo(index);
          },
        ),
      );
    } else {
      return Scaffold(
        drawer: null,
        floatingActionButton: FloatingActionButton(
          tooltip: "tap",
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text("title"),
        ),
        body: PageView(
          controller: pageController,
          children: tabViews,
          onPageChanged: (index) {
            tabController.animateTo(index);
          },
        ),
        // 底部tabbar
        bottomNavigationBar: Material(
          color: Colors.grey,
          child: TabBar(
            controller: tabController,
            tabs: tabItems,
            indicatorColor: Colors.blue, // tab底部选中条颜色
          ),
        ),
      );
    }
  }
}