import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/my_button.dart';
import '../widget/my_logo.dart';

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
      // Navigator.of(context).pushReplacementNamed('/signin');
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
    final TextTheme textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final color = Color(0xFF7964E3);
    final tilteStyle = textTheme.headline.copyWith(fontSize: 28.0);
    final textStyle = textTheme.caption.copyWith(fontSize: 16.0);

    return ScaleTransition(
      scale: _controller,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyLogo(),
            
            Container(height: 12.0,),
            Text('Welcome to', style: tilteStyle),
            Text('Momotaro UI Kit', style: tilteStyle,),

            Container(height: 12.0,),

            Text('The best UI Kit for you next health', style: textStyle),
            Text('and fitness project!', style: textStyle),

            Container(height: 24.0,),
            Image.asset('assets/1.jpg'),

            Container(height: 48.0,),
            MyButton(
              color: color, 
              child: Text('Get Started'),
              radius: 44.0, 
              width: width * 0.8,
              onTap: () {
                Navigator.of(context).pushNamed('/signup');
              },),
            Row(
              children: <Widget>[
                Text('Already have account?', style: textStyle),
                FlatButton(child: Text('Sign in'), textColor: color, onPressed: () {},)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
            // CupertinoButton(
            //   // color: Colors.yellow,
            //   child: Text('直接开始'),
            //   onPressed: () {},
            // )
          ]
        )
      ),
    );
  }

}
