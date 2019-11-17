import 'package:flutter/material.dart';

class VideoHallPage extends StatefulWidget {
  VideoHallPage({Key key}) : super(key: key);

  @override
  _VideoHallPageState createState() => _VideoHallPageState();
}

class _VideoHallPageState extends State<VideoHallPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Center(
        child: Text('放映厅'),
      ),
    );
  }
}
