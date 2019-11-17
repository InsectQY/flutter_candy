import 'package:flutter/material.dart';
import 'package:flutter_candy/constant/color_constant.dart';
import 'package:flutter_candy/modules/ugc_video/list/page/ugc_video_list_page.dart';
import 'package:flutter_candy/modules/ugc_video/list/view_model/ugc_video_category_notifier_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';

class UGCVideoPage extends StatefulWidget {
  UGCVideoPage({Key key}) : super(key: key);

  @override
  _UGCVideoPageState createState() => _UGCVideoPageState();
}

class _UGCVideoPageState extends State<UGCVideoPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<UGCVideoCategoryViewModel>(
      viewModel: UGCVideoCategoryViewModel(),
      onModelReady: (viewModel) {
        viewModel.requestCategoty();
      },
      builder: (context, viewModel, child) {
        _controller =
            TabController(length: viewModel.categories.length, vsync: this);
        return Scaffold(
            appBar: AppBar(
              title: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.white54,
                labelColor: Colors.white,
                controller: _controller,
                isScrollable: true,
                tabs: viewModel.categories
                    .map((item) => Tab(text: item.name))
                    .toList(),
              ),
              backgroundColor: ColorConstant.main,
            ),
            body: TabBarView(
              controller: _controller,
              children: viewModel.categories
                  .map((item) => Center(
                        child: UGCVideoListPage(
                          category: item.category,
                        ),
                      ))
                  .toList(),
            ));
      },
    );
  }
}
