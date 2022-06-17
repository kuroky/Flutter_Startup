import 'package:flutter_douban/define/define.dart';
import 'package:flutter_douban/tools/network.dart';
import 'package:flutter_douban/viewModels/baseViewModel.dart';

class TheatersViewModel extends BaseViewModel {
  /// 获取数据
  load() {
    //theaters
    Fetcher.instance().getHttp(Define.users, {}, finish: (json, errMsg) {
      print('________ errMsg: $errMsg _____________');
    });
  }
}
