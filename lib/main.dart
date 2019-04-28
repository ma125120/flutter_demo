
import 'package:flutter/material.dart';
import './pages/MyHomePage.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import './pages/WelcomePage.dart';

void main() {
  runApp(MaterialApp(
    // title: 'demo',
    theme: new ThemeData(
      primaryColor: Colors.blue,
      // Add the line below to get horizontal sliding transitions for routes.
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }
      ),
    ),
    // initialRoute: WelcomePage.sName,
    routes: {
      WelcomePage.sName: (context) => WelcomePage(),
      '/home': (context) => MyHomePage(),
      // '/detail': (context) => TodoDetail(),
    },
  ));

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}




