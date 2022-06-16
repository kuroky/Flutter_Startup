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

  late Dio _dio;

  init() {
    _dio = createDio();
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: Define.requestTimeout, // ms
      receiveTimeout: Define.requestTimeout,
      sendTimeout: Define.requestTimeout,
      baseUrl: Define.requestBaseUrl,
      responseType: ResponseType.json,
    ));
    return dio;
  }

  void getHttp(String path, Map<String, dynamic> params, {Finish? finish}) {
    _dio.get(path, queryParameters: params).then((response) {
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
}
