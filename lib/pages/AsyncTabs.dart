import 'package:flutter/material.dart';
import 'package:demo/common/dio.dart';
import 'dart:async';
import 'package:demo/models/homeTab.dart';
import 'package:demo/models/response.dart';
import 'package:dio/dio.dart';
import 'dart:core';
import '../components/MyLoading.dart';

class AsyncTabs extends StatefulWidget {

  @override
  _AsyncTabsState createState() => _AsyncTabsState();
}

class _AsyncTabsState extends State<AsyncTabs> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //不会被销毁,占内存中
  @override
  bool get wantKeepAlive => true;

  List<HomeTab> tabs = [];

  TabController _tabController;
  CancelToken token = new CancelToken();

  Future<List<HomeTab>> getTabs() async {

    var res = await request.get('/home/tabs', cancelToken: token);

    if (res.statusCode == 200) {
      ResponseData result = ResponseData.fromJson(res.data);
      List lists = result.data;
      _tabController = TabController(vsync: this, length: lists.length);
      setState(() {
        tabs = lists.map((item) => HomeTab.fromJson(item)).toList();
      });
    }

    return null;
  }

  @override
  initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      // print('当前tab: ${_tabController.index}');
    });

    getTabs();
  }

  @override
  dispose() {
    super.dispose();
    token.cancel("cancelled");
  }

  Widget _loadingWidget() {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(height: 20.0),
        Text('正在加载中，不要着急~'),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    TabBar _tabbar = TabBar(
      tabs: tabs.map((item) => Tab(text: item.name,)).toList(),
      controller: _tabController,
    );

    Widget _body = tabs.length > 0 ? _getPages() :
      _loadingWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text('async tabs'),
        bottom: tabs.length > 0 ? _tabbar : null,
      ),
      body: _body,
    );
  }

  Widget _getPages() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((item) => MyTabView(item)).toList(),
    );
  }
}

class MyTabView extends StatefulWidget {

  final HomeTab tab;

  MyTabView(this.tab);

  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    String name = widget.tab.name;
    print('初始化$name');
  }

  Widget _body() {
    return SizedBox(
      height: 110.0,
      child: Column(children: <Widget>[
        Text(widget.tab.name),
        RaisedButton(
          child: Text('显示加载框'),
          onPressed: () {
            showMyCustomLoadingDialog(context);
          },
        ),
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${widget.tab.name}'),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {

                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          new SliverList(
            // itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == 0) {
                        return _body();
                      }
                  //创建列表项
                  return new Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      );
  }
}
