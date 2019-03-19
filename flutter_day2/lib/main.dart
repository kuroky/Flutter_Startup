import 'package:flutter/material.dart';
import 'package:flutter_day2/BottomTabBarWidget.dart';
import 'package:flutter_day2/TabBarWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarWidget()));
            },
            child: Text("Top Tabp"),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabBarBottomPageWidget()));
            },
            child: Text("Bottom Tap"),
          ),
        ],
      ),
    );
  }
}
