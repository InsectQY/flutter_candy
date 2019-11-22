import 'package:flutter/material.dart';
import 'package:flutter_candy/constant/color_constant.dart';
import 'package:flutter_candy/modules/video/main/view_model/video_list_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';

class VideoListPage extends StatefulWidget {
  VideoListPage({Key key}) : super(key: key);

  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<VideoListViewModel>(
      onModelReady: (viewModel) {
        viewModel.requestCategoty();
      },
      viewModel: VideoListViewModel(),
      builder: (context, viewModel, child) {
        _controller =
            TabController(length: viewModel.categories.length, vsync: this);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorConstant.main,
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child: TabBar(
                    indicatorColor: ColorConstant.main,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.black,
                    labelColor: ColorConstant.main,
                    controller: _controller,
                    isScrollable: true,
                    tabs: viewModel.categories
                        .map((item) => Tab(text: item.name))
                        .toList(),
                  ),
                ),
                Flexible(
                  child: TabBarView(
                    controller: _controller,
                    children: viewModel.categories
                        .map((item) => Center(child: Text(item.category)))
                        .toList(),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
