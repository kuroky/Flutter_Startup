//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_0613/widget/controller_demo_page.dart'
    deferred as controller_demo_page;
import 'package:flutter_0613/widget/clip_demo_page.dart'
    deferred as clip_demo_page;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(splashFactory: NoSplash.splashFactory),
        ),
      ),
      home: MyHomePage(title: 'kky flutter demo'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routers.keys.toList()[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),
    );
  }
}

class ContainerAsyncRouterPage extends StatelessWidget {
  final Future libraryFuture;

  final WidgetBuilder child;

  ContainerAsyncRouterPage(this.libraryFuture, this.child);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: libraryFuture,
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            if (s.hasError) {
              return Scaffold(
                appBar: AppBar(),
                body: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Error: ${s.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
            return child.call(context);
          }
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

Map<String, WidgetBuilder> routers = {
  "文本输入框简单的 Controller": (context) {
    return ContainerAsyncRouterPage(controller_demo_page.loadLibrary(),
        (context) {
      return controller_demo_page.ControllerDemoPage();
    });
  },
  "实现控件圆角不同组合": (context) {
    return ContainerAsyncRouterPage(clip_demo_page.loadLibrary(), (context) {
      return clip_demo_page.ClipDemoPage();
    });
  },
  "列表滑动监听": (context) {
    return ContainerAsyncRouterPage(clip_demo_page.loadLibrary(), (context) {
      return clip_demo_page.ClipDemoPage();
    });
  },
};
