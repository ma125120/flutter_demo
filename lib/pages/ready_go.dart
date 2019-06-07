import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/my_button.dart';
import '../widget/my_logo.dart';
import '../widget/my_widget.dart';

class ReadyGo extends StatefulWidget {
  static final String sName = "/ready/go";

  @override
  _ReadyGoState createState() => _ReadyGoState();
}

class _ReadyGoState extends State<ReadyGo> with SingleTickerProviderStateMixin  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return _getContainer();
      },),
    );
  }

  Widget _getContainer() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/go-bg.png', ),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(24.0),
      child: _getBody(),
    );
  }

  _getBody() {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: _getMain(),),
        
        Builder(builder: (context) {
          return MyButton(
            color: Colors.white, 
            child: Text('Get Started', style: TextStyle(color: Theme.of(context).primaryColor),),
            radius: 44.0, 
            width: width * 0.8,
            onTap: () {
              SnackBar bar = SnackBar(
                content: Text('之后的功能还没写呢~~', style: TextStyle(color: Colors.white),),
                duration: Duration(seconds: 2),
                backgroundColor: Theme.of(context).primaryColor,
              );
              Scaffold.of(context).showSnackBar(bar);
            },
          );
        },),
      ],
    );
  }

  _getMain() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _getLogo(),
        Container(height: 48.0,),
        Text('You are ready to go!', style: TextStyle(fontSize: 28.0, color: Colors.white),),
        Container(height: 24.0,),
        Text('Thanks for takeing your time to', style: TextStyle(fontSize: 16.0, color: Colors.white70),),
        Text('create account with us.Now this is', style: TextStyle(fontSize: 16.0, color: Colors.white70),),
        Text('the fun part, let\'s explore the app', style: TextStyle(fontSize: 16.0, color: Colors.white70),),
        // getMyText(context: context, text: ),
      ],
    );
  }

  _getLogo() {
    return ClipOval(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            width: 120.0,
            height: 120.0,
            padding: EdgeInsets.all(24.0),
            child: MyLogo(width: 28.0),
          ),
        );
  }
}
