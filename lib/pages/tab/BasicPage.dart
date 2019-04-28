import 'dart:async';

// import 'package:demo/common/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 基本使用页面
class BasicPage extends StatefulWidget {
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  bool _loadMore = true;

  @override
  Widget build(BuildContext context) {

    return new EasyRefresh(
      key: _easyRefreshKey,
      behavior: ScrollOverBehavior(),
      refreshHeader: ClassicsHeader(
        key: _headerKey,
        refreshText: "下拉刷新",
        refreshReadyText: "下拉释放刷新",
        refreshingText: "刷新中",
        refreshedText: "刷新完成",
        moreInfo: "",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        loadText: "上拉加载",
        loadReadyText: "上拉释放即可加载",
        loadingText: "加载中",
        loadedText: "加载完成",
        noMoreText: "没有更多数据了~",
        moreInfo: "",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      child: new ListView.builder(
          //ListView的Item
        itemCount: str.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            height: 70.0,
            child: Card(
              child: new Center(
                child: new Text(
                  str[index],
                  style: new TextStyle(fontSize: 18.0),
                ),
              ),
            )
          );
        }
      ),
      onRefresh: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            str.clear();
            str.addAll(addStr);
            _easyRefreshKey.currentState.waitState(() {
              setState(() {
                _loadMore = true;
              });
            });
          });
        });
      },
      loadMore: _loadMore
          ? () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                if (str.length < 20) {
                  setState(() {
                    str.addAll(addStr);
                  });
                } else {
                  _easyRefreshKey.currentState.waitState(() {
                    setState(() {
                      _loadMore = false;
                    });
                  });
                }
              });
            }
          : null,
    );
  }
}
