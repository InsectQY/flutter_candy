import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_video_list.dart';
import 'package:flutter_candy/net/api/video_api.dart';
import 'package:flutter_candy/provider/refresh_view_model.dart';

class UGCVideoListViewModel extends RefreshViewModel {
  /// input
  String category;

  /// output
  List<UGCVideoListModel> get items => _items;

  UGCVideoListViewModel({@required this.category});

  List<UGCVideoListModel> _items = [];

  @override
  Future<void> onRefreshCall() async {
    try {
      var response = await VideoApi.ugcList(category);
      _items = response;
      notifyListeners();
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Future<void> onLoadCall() async {
    try {
      var response = await VideoApi.ugcList(category);
      _items.addAll(response);
      notifyListeners();
    } catch (e) {
      debugPrint(e);
    }
  }
}
