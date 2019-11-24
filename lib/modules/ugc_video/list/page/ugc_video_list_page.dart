import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/ugc_video/list/model/ugc_video_list.dart';
import 'package:flutter_candy/modules/ugc_video/list/view_model/ugc_video_list_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';
import 'package:flutter_candy/widget/base_refresh.dart';
import 'package:flutter_candy/widget/cache_image.dart';
import 'package:flutter_candy/widget/first_refresh_widget.dart';
import 'package:flutter_candy/widget/icon_text.dart';

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
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<UGCVideoListViewModel>(
      viewModel: UGCVideoListViewModel(category: widget.category),
      builder: (context, viewModel, child) {
        return BaseRefresh.custom(
            viewModel: viewModel,
            firstRefresh: true,
            firstRefreshWidget: FirstRefresh(),
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 0.5),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return UGCVideoListCell(
                    item: viewModel.items[index],
                  );
                }, childCount: viewModel.items.length),
              ),
            ]);
      },
    );
  }
}

class UGCVideoListCell extends StatelessWidget {
  final UGCVideoListModel item;

  UGCVideoListCell({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child: Stack(
        children: <Widget>[
          CachedImage(
            fit: BoxFit.cover,
            inSizedBox: true,
            imageUrl: item.content.rawData.video.originCover.urlList.first,
          ),
          Positioned(
            left: 5,
            right: 5,
            bottom: 5,
            child: Column(
              children: <Widget>[
                Text(
                  item.content.rawData.title,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconText(
                      icon: Icons.play_arrow,
                      text: '${item.content.rawData.action.playCountString}次播放',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      '${item.content.rawData.action.diggCountString}赞',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _tap() {
    debugPrint(item.content.rawData.title);
  }
}
