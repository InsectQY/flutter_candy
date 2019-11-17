import 'package:flutter/material.dart';

class VideoListPage extends StatefulWidget {
  VideoListPage({Key key}) : super(key: key);

  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Center(
        child: Text('视频'),
      ),
    );
  }
}
