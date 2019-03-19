import 'package:flutter/material.dart';

/// 1
class TabBarPageFirst extends StatefulWidget {
  
  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void initState() {
    super.initState();
  }

  Widget _buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
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

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs());
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // 防止界面切换时释放

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildSuggestions();
  }
  
}