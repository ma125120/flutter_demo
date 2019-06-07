
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import '../widget/my_button.dart';
import '../widget/my_logo.dart';
import '../widget/my_widget.dart';
import './choose_sex.dart';

class ChooseHead extends StatefulWidget {
  static final String sName = "/head";

  @override
  _ChooseHeadState createState() => _ChooseHeadState();
}

class _ChooseHeadState extends State<ChooseHead> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyLogo(),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: _getBody()
      )
    );
  }

  _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(height: 48.0),
            Container(
              // width: 360.0,
              height: 108.0,
              child: _getEmoji(),
            ),
            
            Container(height: 48.0),
            getMyTitle(context: context, text: 'Profile Picture '),
            Container(height: 24.0),
            getMyText(context: context, text: 'you can select photo from one of'),
            getMyText(context: context, text: 'this emoji or add your own photo as'),
            getMyText(context: context, text: 'profile picture'),
          ],
        ),
        getButton(text: 'Continue', context: context, onTap: () {
          Navigator.of(context).pushNamed(ChooseSex.sName);
        }),
      ],
    );
  }

  _getEmoji() {
    List<String> emojis = [
      '\u{1F600}',
      '\u{1F601}',
      '\u{1F602}',
      '\u{1F923}',
      '\u{1F917}',
      '\u{1F929}',
      '\u{1F603}',
      '\u{1F604}',
      '\u{1F605}',
      '\u{1F606}',
      '\u{1F609}',
      '\u{1F60A}',
      '\u{1F60B}',
      '\u{1F60E}',
      '\u{1F60D}',
      '\u{1F914}',
      '\u{1F928}',
      '\u{1F644}',
      '\u{1F60F}',
    ];

    return Swiper(
      index: _index,
      itemHeight: 100.0,
      itemWidth: 100.0,
      containerHeight: 120.0,
      containerWidth: 120.0,
      itemCount: emojis.length,
      onIndexChanged: (index) {
        setState(() {
          _index = index;
        });
      },
      itemBuilder: (BuildContext context,int index){
        return ClipOval(
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: _index == index ? Theme.of(context).primaryColor :Colors.white,
            ),
            child: Center(
              child: Text(
                emojis[index], 
                style: TextStyle(
                  fontSize: 28.0, 
                  textBaseline: TextBaseline.ideographic,
                  color: _index == index ? Colors.white :Colors.black,
                ),
                
              ) 
            ),
          ),
        );
      },
      viewportFraction: 0.3,
      scale: 0.2,
    );
  }
}

