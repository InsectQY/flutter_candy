import 'package:flutter/material.dart';
import 'package:flutter_candy/constant/color_constant.dart';
import 'package:flutter_candy/modules/video/list/page/video_list_page.dart';
import 'package:flutter_candy/modules/video/main/view_model/video_category_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';

class VideoCategoryPage extends StatefulWidget {
  VideoCategoryPage({Key key}) : super(key: key);

  @override
  _VideoCategoryPageState createState() => _VideoCategoryPageState();
}

class _VideoCategoryPageState extends State<VideoCategoryPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<VideoCategoryViewModel>(
      onModelReady: (viewModel) {
        viewModel.requestCategoty();
      },
      viewModel: VideoCategoryViewModel(),
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
                        .map((item) => VideoListPage(
                              categroy: item.category,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
