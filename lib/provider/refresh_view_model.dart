import 'package:flutter_candy/provider/base_view_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshViewModel extends BaseViewModel {
  final EasyRefreshController _refreshController = EasyRefreshController();

  EasyRefreshController get refreshController => _refreshController;

  Future<void> onRefreshCall() async {}
  Future<void> onLoadCall() async {}

  /// 默认实现刷新回调，不需要 header 时子类重写  get onRefresh => null;
  OnRefreshCallback get onRefresh => onRefreshCall;

  /// 默认实现刷新回调，不需要 footer 时子类重写 get onLoad => null;
  OnLoadCallback get onLoad => onLoadCall;

  callRefresh() {
    _refreshController.callRefresh();
  }

  callLoad() {
    _refreshController.callLoad();
  }

  finishRefresh({
    bool success,
    bool noMore,
  }) {
    _refreshController.finishRefresh(success: success, noMore: noMore);
  }
}
