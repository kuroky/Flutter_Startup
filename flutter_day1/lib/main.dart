import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    debugPrint('press');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return getCard();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// 返回一个居中带图标和文本的item
  getBottomItem(IconData icon, String text) {
    // 充满 row 横向的布局
    return Expanded(
      flex: 1,
      // 居中显示
      child: Center(
        // 横向布局
        child: Row(
          // 主轴居中，即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          // 大小按照最大充满
          mainAxisSize: MainAxisSize.max,
          // 竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            // 间隔
            Padding(padding: EdgeInsets.only(left: 5.0)),
            Text(
              text,
              // 设置字体颜色样式
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              // 超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              // 最长一行
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  getCard() {
    return Container(
      // 卡片包装
      child: Card(
        // 增加点击效果
        child: TextButton(
          onPressed: () {
            print('click');
          },
          child: Padding(
            padding: EdgeInsets.only(
                left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text('一点描述',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                  margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                  alignment: Alignment.topLeft,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Row(
                  // 三个平均分配的横向图标文字
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getBottomItem(Icons.star, "1000"),
                    getBottomItem(Icons.link, "1000"),
                    getBottomItem(Icons.subject, "1000")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
