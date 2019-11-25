import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/video/list/view_model/video_list_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';
import 'package:flutter_candy/widget/base_refresh.dart';

class VideoListPage extends StatefulWidget {
  final String categroy;
  VideoListPage({Key key, this.categroy}) : super(key: key);

  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<VideoListViewModel>(
      viewModel: VideoListViewModel(category: widget.categroy),
      builder: (context, viewModel, child) {
        return BaseRefresh<VideoListViewModel>.custom(
          firstRefresh: true,
          viewModel: viewModel,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return VideoListCell();
                },
                childCount: viewModel.items.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class VideoListCell extends StatelessWidget {
  const VideoListCell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('你好'),
    );
  }
}
