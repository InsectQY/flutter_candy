import 'package:flutter_candy/modules/ugc_video/list/model/ugc_category.dart';
import 'package:flutter_candy/net/api/video_api.dart';
import 'package:flutter_candy/provider/base_view_model.dart';

class VideoCategoryViewModel extends BaseViewModel {
  List<VideoCategory> _categories = [];
  List<VideoCategory> get categories => _categories;

  requestCategoty() async {
    try {
      var response = await VideoApi.category();

      VideoCategory category = VideoCategory(category: 'video', name: '推荐');

      /// 过滤关注
      _categories =
          response.where((item) => !['关注', '直播'].contains(item.name)).toList();
      _categories.insert(0, category);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
