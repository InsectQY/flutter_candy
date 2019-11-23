import 'package:flutter_candy/modules/ugc_video/list/model/ugc_category.dart';
import 'package:flutter_candy/net/api/video_api.dart';
import 'package:flutter_candy/provider/base_view_model.dart';

class UGCVideoCategoryViewModel extends BaseViewModel {
  List<VideoCategory> _categories = [];

  List<VideoCategory> get categories => _categories;

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
