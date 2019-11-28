import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_candy/modules/video/list/model/news_list.dart';
import 'package:flutter_candy/modules/video/list/view_model/video_list_view_model.dart';
import 'package:flutter_candy/provider/provider_widget.dart';
import 'package:flutter_candy/widget/base_refresh.dart';
import 'package:flutter_candy/widget/cache_image.dart';
import 'package:flutter_candy/widget/first_refresh_widget.dart';
import 'package:flutter_candy/widget/icon_text.dart';
import 'package:flutter_candy/widget/progress_view.dart';

class VideoListPage extends StatefulWidget {
  final String categroy;
  VideoListPage({Key key, this.categroy}) : super(key: key);

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
    return ProviderWidget<VideoListViewModel>(
      viewModel: VideoListViewModel(category: widget.categroy),
      builder: (context, viewModel, child) {
        return BaseRefresh<VideoListViewModel>.custom(
          firstRefresh: true,
          firstRefreshWidget: FirstRefresh(),
          viewModel: viewModel,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return VideoListCell(
                    item: viewModel.items[index].content,
                  );
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
  final NewsModel item;

  VideoListCell({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // item.;
    return Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 5, color: Color(0xFFF0F0F0)))),
        child: Column(
          children: <Widget>[
            VideoListImage(item: item),
            VideoListBottom(item: item)
          ],
        ));
  }
}

class VideoListImage extends StatelessWidget {
  final NewsModel item;
  const VideoListImage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CachedImage(
              placeholder: (context, url) => ProgressView(),
              imageUrl: item.videoDetailInfo?.detailVideoLargeImage?.url ?? '',
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              }),
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                Text('${item.videoDetailInfo?.videoWatchCountString}次播放',
                    style: TextStyle(color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VideoListBottom extends StatelessWidget {
  final NewsModel item;
  const VideoListBottom({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NewsAvatar(
              imageUrl: item.userInfo?.avatarUrl ?? '',
              userName: item.userInfo?.name ?? ''),
          IconText(
            style: TextStyle(color: Colors.black),
            text: item.commentCountString,
            icon: Icons.mode_comment,
            iconColor: Colors.black,
          )
        ],
      ),
    );
  }
}

class NewsAvatar extends StatelessWidget {
  final String imageUrl;
  final String userName;
  const NewsAvatar({Key key, @required this.imageUrl, @required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          userName,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
