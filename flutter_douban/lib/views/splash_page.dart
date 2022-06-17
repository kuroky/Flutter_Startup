//import 'dart:html';

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
    print("being : ${DateTime.now()}");
    Fetcher.instance().createDio();
    Future.delayed(const Duration(seconds: 2), () {
      print("end : ${DateTime.now()}");
      Navigator.of(context).pushNamed(Routes.mainPage);
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
