import 'dart:async';

import 'package:flutter/material.dart';
import './MyHomePage.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin  {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500,),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('动画完成');
      }
    });

    _controller.forward();
    
  }

  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(hadInit) {
      return;
    }
    hadInit = true;
    ///防止多次进入

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed('/home');
      // UserDao.initUserInfo(store).then((res) {
      //   if (res != null && res.result) {
      //     NavigatorUtils.goHome(context);
      //   } else {
      //     NavigatorUtils.goLogin(context);
      //   }
      //   return true;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return ScaleTransition(
      scale: _controller,
      child: Image.network(
        'http://image3.xyzs.com/upload/d5/6f/1451265843508069/20151230/145140581662753_0.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

}
