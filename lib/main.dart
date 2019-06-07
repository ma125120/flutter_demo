import 'package:flutter/material.dart';
import './pages/welcome.dart';
import './pages/sign_up.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import './pages/choose_sex.dart';
import './pages/choose_head.dart';
import './pages/help_you.dart';
import './pages/ready_go.dart';

void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF7964E3),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF6F7FB),
        textTheme: TextTheme(
          // title: textStyle,
          // caption: textStyle,
        ),
      ),
      routes: {
        WelcomePage.sName: (context) => WelcomePage(),
        SignUp.sName: (context) => SignUp(),
        ChooseSex.sName: (context) => ChooseSex(),
        ChooseHead.sName: (context) => ChooseHead(),
        HelpYou.sName: (context) => HelpYou(),
        ReadyGo.sName: (context) => ReadyGo(),
        // '/home': (context) => MyHomePage(),
        // '/detail': (context) => TodoDetail(),
      },
    );
  }
}
