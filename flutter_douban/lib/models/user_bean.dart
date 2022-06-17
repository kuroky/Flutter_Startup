import 'package:flutter/material.dart';

class UserBean with ChangeNotifier {
  String name;
  int? age;

  UserBean({this.name = "", this.age});

  void update(UserBean userBean) {
    name = userBean.name;
    age = userBean.age;
    notifyListeners();
  }
}
