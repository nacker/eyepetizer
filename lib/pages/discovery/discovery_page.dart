import 'package:flutter/material.dart';
import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/widget/app_bar.dart';
import 'package:eyepetizer/widget/tab_bar.dart';
import 'CategoryPage/category_page.dart';
import 'FollowPage/follow_page.dart';
import 'NewsPage/news_page.dart';
import 'RecommendPage/recommend_page.dart';
import 'TopicPage/topic_page.dart';

const TAB_LABEL = ['关注', '分类', '专题', '资讯', '推荐'];

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

// SingleTickerProviderStateMixin:ticker,定义 TabController 需要
class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // vsync:ticker 驱动动画,每次屏幕刷新都会调用TickerCallback，
    _tabController = TabController(length: TAB_LABEL.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar(
        MyString.discovery,
        showBack: false,
        // TabBar 和 TabBarView 结合使用
        bottom: tabBar(
          // 与TabBarView 同一个 controller
          controller: _tabController,
          tabs: TAB_LABEL.map((String label) {
            return Tab(text: label);
          }).toList(),
        ),
      ),
      body: TabBarView(
        // 与TabBar 同一个 controller
        controller: _tabController,
        // 与标签个数一致
        children: <Widget>[
          FollowPage(),
          CategoryPage(),
          TopicPage(),
          NewsPage(),
          RecommendPage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
