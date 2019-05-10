
import 'package:flutter/material.dart';
import './pages/MyHomePage.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import './models/UserInfo.dart';

void main() {
  final providers = Providers()
      ..provide(Provider.function((context) => UserInfo('初始姓名12')));

  runApp(
    ProviderNode(
      providers: providers,
      child: MaterialApp(
        // title: 'demo',
        theme: new ThemeData(
          primaryColor: Colors.blue,
          // highlightColor: Colors.transparent,   //将点击高亮色设为透明
          // splashColor: Colors.transparent,    //将喷溅颜色设为透明
          // bottomAppBarColor: new Color.fromRGBO(244, 245, 245, 1.0),    //设置底部导航的背景色
          // scaffoldBackgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),    //设置页面背景颜色
          // primaryIconTheme: new IconThemeData(color: Colors.blue),    //主要icon样式，如头部返回icon按钮
          // indicatorColor: Colors.blue,    //设置tab指示器颜色
          // iconTheme: new IconThemeData(size: 18.0),   //设置icon样式
          // primaryTextTheme: new TextTheme(    //设置文本样式
          //   title: new TextStyle(color: Colors.black, fontSize: 16.0)
          // ),
          // Add the line below to get horizontal sliding transitions for routes.
          // pageTransitionsTheme: PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          //   }
          // ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          // '/detail': (context) => TodoDetail(),
        },
      )
  ));

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
