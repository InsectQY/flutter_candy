import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_category.dart';
import 'package:flutter_candy/net/api/video_api.dart';

class UGCVideoCategoryViewModel with ChangeNotifier {
  List<UGCCategory> _categories = [];

  List<UGCCategory> get categories => _categories;

  requestCategoty() async {
    try {
      var response = await VideoApi.ugcCategory();

      /// 过滤关注
      _categories = response.data.where((item) => item.name != '关注').toList();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
