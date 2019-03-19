import 'package:flutter/material.dart';
import 'package:flutter_day2/TabBarBottomWidget.dart';
import 'package:flutter_day2/TabBarTopWidget.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarTopWidget()));
            },
            child: Text("Top Tab"),
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
