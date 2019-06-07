import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import '../widget/my_button.dart';
import '../widget/my_logo.dart';
import '../widget/my_widget.dart';
import './help_you.dart';

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(44),
  ),
  gapPadding: 0.0,
);

class ChooseSex extends StatefulWidget {
  static final String sName = "/sex";

  @override
  _ChooseSexState createState() => _ChooseSexState();
}

class _ChooseSexState extends State<ChooseSex> {
  final _formKey = GlobalKey<FormState>();

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
            getMyTitle(context: context, text: 'Which one are you?'),
            Container(height: 24.0),
            MyRadioCard(
              value: 0, 
              onChange: (value) {

              },
              ),
            Container(height: 24.0),
            getMyText(context: context, text: 'To give you a better experience we'),
            getMyText(context: context, text: 'need to know your gender'),
          ],
        ),
        getButton(text: 'Continue', context: context, onTap: () {
          Navigator.of(context).pushNamed(HelpYou.sName);
        }),
      ],
    );
  }
}

class MyRadioCard extends StatefulWidget {
  final int value;
  final onChange;

  MyRadioCard({
    this.value,
    this.onChange
  });

  @override
  _MyRadioCardState createState() => _MyRadioCardState();
}

class _MyRadioCardState extends State<MyRadioCard> {
  int _value;
  @override
  initState() {
    super.initState();
    setState(() {
      _value = widget.value;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return _getCards();
  }

  _getCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getWrapCard('Male', 'assets/male.png', 0),
        _getWrapCard('Female', 'assets/female.png', 1),
      ],
    );
  }

  _getWrapCard(text, asset, sex) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _getCard(text, asset, sex),
      onTap: () {
        widget.onChange(sex);
        setState(() {
          _value = sex;
        });
      },
    );
  }
  _getCard(text, asset, sex) {
    final _width = (MediaQuery.of(context).size.width * 0.8) / 2;
    final isCheck = sex == _value;

    return Container(
      width: _width,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: isCheck ? [
          BoxShadow(
            blurRadius: 10.0, 
            color: Theme.of(context).primaryColor.withOpacity(0.2), 
            offset: Offset(0.0, 5.0),
            spreadRadius: 2.0)
        ] : null,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              getMyRadioIcon(isCheck, context)
            ],
          ),
          Container(height: 12.0),
          Image.asset(asset),
          Container(height: 24.0),
          Text(text, style: TextStyle(fontSize: 24.0,)),
          Container(height: 12.0),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
