//import 'dart:html';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_douban/define/define.dart';
import 'package:flutter_douban/tools/network.dart';
import 'package:flutter_douban/views/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //log("being : ${DateTime.now()}");
    Fetcher.instance().createDio();
    Future.delayed(const Duration(seconds: 2), () {
      //log("end : ${DateTime.now()}");
      //throw AssertionError('throw AssertionError');
    }).then((value) {
      log('success : ${DateTime.now()}');
      //Navigator.of(context).pushNamed(Routes.mainPage);
    }).catchError((err) {
      log('fail: ${err.toString()}');
    }).whenComplete(() {
      log('whenComplete');
    });
    //dotest();
    task();
  }

  void dotest() {
    dologin('name', '12').then((uid) {
      return userInfo(uid);
    }).then((userinfo) {
      return saveUser(userinfo);
    }).then((e) {
      print('e: ${e}');
    }).catchError((err) {
      print('e: ${err}');
    });
  }

  void task() async {
    try {
      log("1 : ${DateTime.now()}");
      String id = await dologin('name', '');
      log("2 : ${DateTime.now()}");
      String ufo = await userInfo(id);
      log("3 : ${DateTime.now()}");
      bool succ = await saveUser(ufo);
      log("4 : ${DateTime.now()}");
      print('save data : ${succ}');
    } catch (e) {
      print(e);
    }
  }

  /// login
  Future<String> dologin(String name, String pwd) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return '123';
    });
  }

  /// info
  Future<String> userInfo(String uid) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return 'zhang';
    });
  }

  /// save
  Future<bool> saveUser(String info) {
    return Future.delayed(const Duration(milliseconds: 200), () {
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("douban",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
