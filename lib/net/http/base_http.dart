import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/adapter.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        // 抓包
        return "PROXY 192.168.50.40:8888";
      };
    };

    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    init();
  }

  void init();
}
