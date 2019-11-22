import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_video_list.dart';
import 'package:flutter_candy/net/api/video_api.dart';

class UGCVideoListViewModel with ChangeNotifier {
  List<UGCVideoListModel> _items = [];

  List<UGCVideoListModel> get items => _items;

  request({@required String category}) async {
    try {
      var response = await VideoApi.ugcList(category);
      _items = response;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
