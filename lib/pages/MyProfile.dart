
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/GradientButton.dart';

class MyProfile extends StatelessWidget {
  final _tabs = <String>['TabA', 'TabB'];

  Widget _getCustomView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text('NestedScroll Demo'),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(background: Image.network('https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png', fit: BoxFit.cover)),
          bottom: TabBar(tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 18.0))).toList()),
        ),
        SliverToBoxAdapter(
          child: Text('SliverToBoxAdapter'),
        ),
        // SliverPadding(
        //   padding: EdgeInsets.all(12.0),
        //   sliver: SliverFillRemaining(
        //     child: Text('data'),
        //   ),
        // ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项      
                return new Container(
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

  @override
  Widget build(BuildContext context) {
    return NestedScrollDemoPage();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('个人中心'),
      // ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getCustomView(),
              GradientButton(
                child: Text('渐变'),
                colors: [ Colors.yellow[800], Colors.purple[800], ],
                radius: 20.0,
                width: 200,
                onTap: () {
                  print('点击渐变按钮');
                },
              ),
              Container(height: 20.0,),
              
              CupertinoButton.filled(
                child: Text('个人中心'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text('提示信息'),
                        content: Text('IOS dialog'),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true, 
                            child: Text("关闭"), 
                            onPressed: () { Navigator.of(context).pop(); },
                          )
                        ]
                      );
                    }
                  );
                },
              ),
            ],
          )
        )
      )
    );
  }
}

class NestedScrollDemoPage extends StatelessWidget {
  final _tabs = <String>['导航1', '导航2'];
  final colors = <Color>[Colors.red, Colors.green, Colors.blue, Colors.pink, Colors.yellow, Colors.deepPurple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    SliverOverlapAbsorber(
                      // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      child: SliverAppBar(
                        pinned: true,
                        title: Text('NestedScroll Demo'),
                        expandedHeight: 120.0,
                        flexibleSpace: FlexibleSpaceBar(background: Image.network('https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png', fit: BoxFit.cover)),
                        bottom: TabBar(tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 18.0))).toList()),
                        forceElevated: innerScrolled,
                      ),
                    )
                  ],
              body: TabBarView(
                  children: _tabs
                      // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                      // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                      .map((tab) => Builder(
                            builder: (context) => CustomScrollView(
                                  // key 保证唯一性
                                  key: PageStorageKey<String>(tab),
                                  slivers: <Widget>[
                                    // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                    SliverOverlapInjector(
                                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                                    SliverGrid(
                                        delegate: SliverChildBuilderDelegate(
                                            (_, index) => Image.asset('images/ali.jpg'),
                                            childCount: 8),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0)),
                                    SliverFixedExtentList(
                                        delegate: SliverChildBuilderDelegate(
                                            (_, index) => Container(
                                                child: Text('$tab - item${index + 1}',
                                                    style: TextStyle(fontSize: 20.0, color: colors[index % 6])),
                                                alignment: Alignment.center),
                                            childCount: 15),
                                        itemExtent: 50.0)
                                  ],
                                ),
                          ))
                      .toList()))),
    );
  }
}
