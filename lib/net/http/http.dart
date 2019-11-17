import 'package:flutter_candy/constant/http_constant.dart';
import 'package:flutter_candy/net/http/base_http.dart';
import 'package:flutter_candy/net/interceptor/api_interceptor.dart';

/// 头条
final TouTiaoHttp ttHttp = TouTiaoHttp();

/// 阳光宽频网
final YangGuangHttp ygHttp = YangGuangHttp();

class TouTiaoHttp extends BaseHttp {
  @override
  void init() {
    options.baseUrl = HttpConstant.touTiaoUrl;
    options.queryParameters = HttpConstant.TTParameter;
    interceptors.add(ApiInterceptor());
  }
}

class YangGuangHttp extends BaseHttp {
  @override
  void init() {
    options.baseUrl = HttpConstant.yangGuangUrl;
    interceptors.add(ApiInterceptor());
  }
}
