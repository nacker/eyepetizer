import 'package:animations/animations.dart';
import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/pages/home/search/home_search_page.dart';
import 'package:eyepetizer/widget/app_bar.dart';
import 'package:flutter/material.dart';

import 'home_body_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

/// AutomaticKeepAliveClientMixin作用：切换tab后保留tab的状态，避免initState方法重复调用
/// 1.需重写 wantKeepAlive 返回 true
/// 2.必须调用 super.build(context);
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar(
        MyString.home,
        showBack: false,
        actions: <Widget>[
          // 搜索图标
          _searchIcon(),
        ],
      ),
      body: HomeBodyPage(),
    );
  }

  /// 搜索图标
  Widget _searchIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: OpenContainer(
        closedElevation: 0.0,
        closedBuilder: (context, action) {
          return Icon(
            Icons.search,
            color: Colors.black87,
          );
        },
        openBuilder: (context, action) {
          return SearchPage();
        },
      ),
    );
  }
}