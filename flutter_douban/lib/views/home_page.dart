import 'package:flutter/material.dart';
import 'package:flutter_douban/tools/douban_appbar.dart';
import 'package:flutter_douban/tools/network.dart';
import 'package:flutter_douban/viewModels/provider.dart';
import 'package:flutter_douban/viewModels/theatersViewModel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    //Fetcher.instance.createDio();
    //Fetcher.instance.getHttp("http://www.baidu.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DouBanAppBar(title: "首页", canBack: false).bulid(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProviderWidget<TheatersViewModel>(
                model: TheatersViewModel(),
                onReady: (model) {
                  model.load();
                },
                builder: (context, model, child) {
                  return const Text("data");
                }),
          ],
        ),
      ),
    );
  }
}
