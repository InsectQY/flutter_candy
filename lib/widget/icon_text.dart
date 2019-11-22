import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final TextStyle style;
  IconText(
      {Key key,
      @required this.icon,
      @required this.text,
      this.iconColor = Colors.white,
      @required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
          ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
