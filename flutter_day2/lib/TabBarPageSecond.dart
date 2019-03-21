import 'package:flutter/material.dart';

class TabBarPageSecond extends StatefulWidget {

  @override 
  _TabBarPageSecond createState() => _TabBarPageSecond();
}

class _TabBarPageSecond extends State<TabBarPageSecond> with AutomaticKeepAliveClientMixin {
  
  final suggestions = <String>[];
  final font = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
  }

  Widget buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: font,
      ),
    );
  }

  generateWordPairs() {
    return [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11"
    ];
  }

  Widget buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        var index = i ~/ 2;
        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs());
        }
        return buildRow(generateWordPairs());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildSuggestions();
  }

  @override
  bool get wantKeepAlive => true;



}