import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/views/home_page.dart';

/// 常量
class Define {
  /// base request url
  static const String requestBaseUrl = "https://api.douban.com";

  /// 超时时间
  static const int requestTimeout = 30000;

  static const String appkey = "0df993c66c0c636e29ecbb5344252a4a";

  /// 接口
  static const String theaters = "/v2/movie/in_theaters?appkey=$appkey";

  static const String users = "/user/1000001?appkey=$appkey";
}

class Routes {
  static const String mainPage = "main_page";

  static Route fetchRoutes(RouteSettings setting) {
    String? name = setting.name;
    Object? argument = setting.arguments;
    return CupertinoPageRoute(builder: (_) {
      return _findPage(name, argument);
    });
  }

  static Widget _findPage(String? name, Object? object) {
    Widget? page;
    switch (name) {
      case mainPage:
        page = const MainPage();
        break;
    }

    if (page != null) {
      return page;
    }
    return Container();
  }
}
