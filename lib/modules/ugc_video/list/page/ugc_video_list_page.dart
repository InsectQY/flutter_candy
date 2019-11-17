import 'package:flutter/material.dart';
import 'package:flutter_candy/net/api/video_api.dart';

class UGCVideoListPage extends StatefulWidget {
  /// 分类名称
  final String category;

  UGCVideoListPage({Key key, this.category}) : super(key: key);

  @override
  _UGCVideoListPageState createState() => _UGCVideoListPageState();
}

class _UGCVideoListPageState extends State<UGCVideoListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _request();
    super.initState();
  }

  _request() async {
    try {
      var response = await VideoApi.ugcList(widget.category);
      print(response.first.content.rawData.title);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Center(
        child: Text(widget.category),
      ),
    );
  }
}
