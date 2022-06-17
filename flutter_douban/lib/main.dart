import 'package:flutter/material.dart';
import 'package:flutter_douban/define/define.dart';
import 'package:flutter_douban/views/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return Routes.fetchRoutes(settings);
      },
      home: const SplashPage(),
    );
  }
}
