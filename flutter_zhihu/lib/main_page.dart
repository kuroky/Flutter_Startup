import 'package:flutter/material.dart';
import 'NavigationIconView.dart';

class Mainpage extends StatefulWidget {
  
  @override
  _Mainpage createState() {
    return _Mainpage();
  }
}

class _Mainpage extends State<Mainpage> with TickerProviderStateMixin {
  
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  setupNavigationViews() {
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: Icon(Icons.assessment),
        title: Text("1"),
        vsync: this
      ),
      NavigationIconView(
        icon: Icon(Icons.all_inclusive),
        title: Text("2"),
        vsync: this
      ),
      NavigationIconView(
        icon: Icon(Icons.add_shopping_cart),
        title: Text("3"),
        vsync: this
      ),
      NavigationIconView(
        icon: Icon(Icons.add_alert),
        title: Text("4"),
        vsync: this
      ),
      NavigationIconView(
        icon: Icon(Icons.perm_identity),
        title: Text("5"),
        vsync: this
      )
    ];

    _pageList = <StatefulWidget>[
      DrawerController(),
    ];
  }

  @override
  void initState() {
    super.initState();
    setupNavigationViews();
    _currentPage =_pageList[0];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews
      .map((NavigationIconView navigationnIconView) {
        return navigationnIconView.item;
      })
      .toList(),
      currentIndex: 0,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: _currentPage,
      ),
      bottomNavigationBar: Text("bottomNavigationBar"),
    );
  }
}
