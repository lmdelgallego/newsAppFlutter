import 'package:flutter/material.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Tab 2 Page')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
