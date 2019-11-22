import 'package:dio/dio.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_category.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_video_list.dart';
import 'package:flutter_candy/net/http/http.dart';

class VideoApi {
  /// 小视频分类
  static Future<UGCVideoPageData> ugcCategory() async {
    Response response = await ttHttp.get('category/get_ugc_video/2/');
    return UGCVideoPageData.fromJson(response.data);
  }

  /// 小视频列表
  static Future<List<UGCVideoListModel>> ugcList(String category) async {
    Response response = await ttHttp
        .get('api/news/feed/v88/', queryParameters: {'category': category});
    return response.data
        .map<UGCVideoListModel>((item) => UGCVideoListModel.fromJson(item))
        .toList();
  }

  /// 视频分类
  static Future<List<VideoCategory>> category() async {
    Response response = await ttHttp.get('video_api/get_category/v3/');
    return response.data
        .map<VideoCategory>((item) => VideoCategory.fromJson(item))
        .toList();
  }
}
