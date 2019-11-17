import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_candy/net/base_response.dart';
import 'package:flutter_candy/net/exception/not_success_exception.dart';
import 'package:flutter_candy/net/http/http.dart';

/// App相关 API
class ApiInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }

  @override
  onResponse(Response response) {
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.success) {
      response.data = respData.data;
      return ttHttp.resolve(response);
    } else {
      throw NotSuccessException.fromRespData(respData);
    }
  }
}

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    return options;
  }
}
