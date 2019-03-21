import 'package:flutter/material.dart';

/// 1
class TabBarPageFirst extends StatefulWidget {
  
  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst> with AutomaticKeepAliveClientMixin {
  final suggestions = <String>[];
  final biggerFont = const TextStyle(fontSize: 18.0);

  void initState() {
    super.initState();
  }

  Widget buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: biggerFont,
      ),
    );
  }

  generateWordPairs() {
    return [
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444"
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
        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs());
        }
        return buildRow(suggestions[index]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // 防止界面切换时释放

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildSuggestions();
  }
  
}