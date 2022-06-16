import 'package:flutter/material.dart';

/// custom appbar
class DouBanAppBar {
  final String title;
  final bool canBack;

  DouBanAppBar({this.title = "", this.canBack = true});

  PreferredSizeWidget bulid(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: canBack,
    );
  }
}
