class StringUtil {
  static String countString(int count) {
    return count / 10000 >= 1
        ? '${(count / 10000).toStringAsFixed(1)}万'
        : '$count';
  }
}
