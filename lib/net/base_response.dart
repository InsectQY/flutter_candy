abstract class BaseResponseData {
  BaseResponseData({this.offset, this.message, this.data});

  dynamic data;

  /// 是否有更多数据
  bool hasMore;

  /// 返回 "success" 为成功
  String message;

  int offset = 0;

  @override
  String toString() {
    return 'BaseRespData{code: $offset, message: $message, data: $data}';
  }

  bool get success;
}

class ResponseData extends BaseResponseData {
  bool get success => message == 'success';

  ResponseData.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    hasMore = json['has_more'];
    message = json['message'];
    data = json['data'];
  }
}
