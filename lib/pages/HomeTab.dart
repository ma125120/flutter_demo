import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './tab/FirstTab.dart';
import './TodoList.dart';
import './MyProfile.dart';
import './tab/HybridList.dart';

class HomeTab extends StatefulWidget {

  HomeTab({Key key, }) : super(key: key);

  @override
  _HomeTab createState() => new _HomeTab();
}

class _HomeTab extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      // print('当前tab: ${_tabController.index}');
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('顶部tab切换'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              text: '列表',
            ),
            new Tab(
              text: 'tab1',
            ),
            new Tab(
              text: 'tab2',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          TodoList(),
          MyProfile(),
          HybridList(),
        ],
      ),
    );
  }
}

