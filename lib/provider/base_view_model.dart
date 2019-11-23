import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;

  @override
  void notifyListeners() {
    if (_disposed) return;

    super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
