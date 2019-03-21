import 'package:flutter/material.dart';

class TabBarPageThird extends StatefulWidget {
  
  @override 
  _TabBarPageThird createState() => _TabBarPageThird();
}

class _TabBarPageThird extends State<TabBarPageThird> with AutomaticKeepAliveClientMixin {
  final suggestions = <String>[];
  final font = TextStyle(fontSize: 18.0);

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
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;
        if (index >=suggestions.length) {
          suggestions.addAll(generateWordPairs());
        }
        return buildRow(suggestions[i]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildSuggestions();
  }
}