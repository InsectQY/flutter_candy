import 'package:flutter/material.dart';
import 'package:flutter_candy/app/item.dart';
import 'package:flutter_candy/constant/color_constant.dart';
import 'package:flutter_candy/modules/mine/main/page/mine_page.dart';
import 'package:flutter_candy/modules/ugc_video/list/page/ugc_video_page.dart';
import 'package:flutter_candy/modules/video/main/page/video_list_page.dart';
import 'package:flutter_candy/modules/video_hall/main/page/video_all_page.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  final pageController = PageController(initialPage: 0);

  List<BottomNavigationBarItem> itemList;

  final pageList = [
    VideoHallPage(),
    VideoListPage(),
    UGCVideoPage(),
    MinePage()
  ];
  final items = [
    Item(title: '放映厅', normalIcon: Icons.videocam),
    Item(title: '视频', normalIcon: Icons.video_library),
    Item(title: '小视频', normalIcon: Icons.star),
    Item(title: '我的', normalIcon: Icons.people)
  ];

  @override
  void initState() {
    super.initState();
    if (itemList == null) {
      itemList = items.map((item) => _bottomNavigationBarItem(item)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: pageList,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: _bottomNavigationBar,
      ),
    );
  }

  /// Tab bar
  BottomNavigationBar get _bottomNavigationBar {
    return BottomNavigationBar(
      items: itemList,
      iconSize: 24,
      currentIndex: _currentPageIndex,
      selectedItemColor: ColorConstant.main,
      unselectedItemColor: ColorConstant.tabBarNormal,
      type: BottomNavigationBarType.fixed,
      onTap: _tabBarTap,
    );
  }

  /// Tab bar Item
  BottomNavigationBarItem _bottomNavigationBarItem(Item item) {
    return BottomNavigationBarItem(
        icon: Icon(item.normalIcon),
        title: Text(item.title, style: TextStyle(fontSize: 12)));
  }

  _tabBarTap(int index) {
    setState(() {
      _currentPageIndex = index;
      pageController.jumpToPage(index);
    });
  }
}
