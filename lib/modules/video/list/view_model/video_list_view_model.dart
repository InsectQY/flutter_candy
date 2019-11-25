import 'package:flutter_candy/modules/video/list/model/news_list.dart';
import 'package:flutter_candy/net/api/video_api.dart';
import 'package:flutter_candy/provider/refresh_view_model.dart';
import 'package:flutter/material.dart';

class VideoListViewModel extends RefreshViewModel {
  List<NewsListModel> _items = [];

  /// input
  String category;

  /// output
  List<NewsListModel> get items => _items;

  VideoListViewModel({@required this.category});

  @override
  Future<void> onRefreshCall() async {
    var response = await VideoApi.videoList(category);
    _items = response;
    notifyListeners();
  }

  @override
  Future<void> onLoadCall() async {
    var response = await VideoApi.videoList(category);
    _items.addAll(response);
    notifyListeners();
  }
}
