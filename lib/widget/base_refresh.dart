import 'package:flutter/material.dart';
import 'package:flutter_candy/provider/refresh_view_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class BaseRefresh<T extends RefreshViewModel> extends EasyRefresh {
  final T viewModel;

  BaseRefresh(
      {@required this.viewModel,
      key,
      bool taskIndependence = false,
      ScrollController scrollController,
      Header header,
      Footer footer,
      bool firstRefresh,
      Widget firstRefreshWidget,
      int headerIndex,
      emptyWidget,
      topBouncing = true,
      bottomBouncing = true,
      @required child})
      : super(
            key: key,
            child: child,
            controller: viewModel.refreshController,
            onRefresh: viewModel.onRefresh,
            onLoad: viewModel.onLoad,
            taskIndependence: taskIndependence,
            scrollController: scrollController,
            header: header,
            footer: footer,
            firstRefresh: firstRefresh,
            firstRefreshWidget: firstRefreshWidget,
            headerIndex: headerIndex,
            emptyWidget: emptyWidget,
            topBouncing: topBouncing,
            bottomBouncing: bottomBouncing,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true);
}
