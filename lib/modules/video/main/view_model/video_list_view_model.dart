import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_category.dart';
import 'package:flutter_candy/net/api/video_api.dart';

class VideoListViewModel extends ChangeNotifier {
  List<VideoCategory> _categories = [];
  List<VideoCategory> get categories => _categories;

  requestCategoty() async {
    try {
      var response = await VideoApi.category();

      /// 过滤关注
      _categories = response.where((item) => item.name != '关注').toList();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
