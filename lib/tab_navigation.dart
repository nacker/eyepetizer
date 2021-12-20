import 'package:flutter/material.dart';
import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/pages/discovery/discovery_page.dart';
import 'package:eyepetizer/pages/home/home_page.dart';
import 'package:eyepetizer/pages/hot/hot_page.dart';
import 'package:eyepetizer/pages/mine/mine_page.dart';
import 'package:eyepetizer/utils/toast_util.dart';
import 'package:eyepetizer/viewmodel/tab_navigation_viewmodel.dart';
import 'package:eyepetizer/widget/provider_widget.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  DateTime lastTime;
  Widget _currentBody = Container(
    color: Colors.blue,
  );

  PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 防止用户误碰
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            DiscoveryPage(),
            HotPage(),
            MinePage(),
          ],
        ),
        bottomNavigationBar: ProviderWidget<TabNavigationViewModel>(
          model: TabNavigationViewModel(),
          builder: (context, model, child) {
            return BottomNavigationBar(
              currentIndex: model.currentIndex,
              // 固定title
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff000000),
              unselectedItemColor: Color(0xff9a9a9a),
              items: _item(),
              // index 值为0，1，2，3
              onTap: (index) {
                if (model.currentIndex != index) {
                  // 直接跳转不带动画，自动 setState
                  _pageController.jumpToPage(index);
                  model.changeBottomTabIndex(index);
                }
              },
            );
          },
        ),
      ),
    );
  }

  // _onTap(int index) {
  //   switch (index) {
  //     case 0:
  //       _currentBody = Container(color: Colors.blue);
  //       break;
  //     case 1:
  //       _currentBody = Container(color: Colors.brown);
  //       break;
  //     case 2:
  //       _currentBody = Container(color: Colors.amber);
  //       break;
  //     case 3:
  //       _currentBody = Container(color: Colors.red);
  //       break;
  //   }
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  List<BottomNavigationBarItem> _item() {
    return [
      _bottomItem(MyString.home, 'images/ic_home_normal.png',
          'images/ic_home_selected.png'),
      _bottomItem(MyString.discovery, 'images/ic_discovery_normal.png',
          'images/ic_discovery_selected.png'),
      _bottomItem(MyString.hot, 'images/ic_hot_normal.png',
          'images/ic_hot_selected.png'),
      _bottomItem(MyString.mine, 'images/ic_mine_normal.png',
          'images/ic_mine_selected.png'),
    ];
  }

  _bottomItem(String title, String normalIcon, String selectorIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        normalIcon,
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        selectorIcon,
        width: 24,
        height: 24,
      ),
      label: title,
    );
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      MyToast.showTip(MyString.exit_tip);
      return false;
    } else {
      // 自动出栈
      return true;
    }
  }
}
