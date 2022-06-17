import 'package:dio/dio.dart';
import 'package:flutter_douban/define/define.dart';

typedef Finish = void Function(dynamic json, String? errMsg);

class Fetcher {
  static Fetcher? _fetcher;

  Fetcher._internal();

  static Fetcher instance() {
    _fetcher ??= Fetcher._internal();
    return _fetcher!;
  }

  Dio? _dio;

  init() {
    _dio = createDio();
  }

  createDio() {
    if (_dio != null) {
      return;
    }
    _dio = Dio(BaseOptions(
      connectTimeout: Define.requestTimeout, // ms
      receiveTimeout: Define.requestTimeout,
      sendTimeout: Define.requestTimeout,
      baseUrl: Define.requestBaseUrl,
      responseType: ResponseType.json,
    ));
  }

/*
  void getHttp(String path, Map<String, dynamic> params, {Finish? finish}) {
    _dio!.get(path, queryParameters: params).then((response) {
      String? errMsg;
      dynamic data;
      if (response.statusCode == 200) {
        data = response.data;
      } else {
        errMsg = response.statusMessage;
      }
      if (finish != null) {
        finish(data, errMsg);
      }
    });
  }
  */

  void getHttp(String path, Map<String, dynamic> params,
      {Finish? finish}) async {
    try {
      Dio did = Dio();
      did.options.baseUrl = Define.requestBaseUrl;
    
      var response = await did.get(path);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
