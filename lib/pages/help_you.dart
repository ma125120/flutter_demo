import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import '../widget/my_button.dart';
import '../widget/my_logo.dart';
import '../widget/my_widget.dart';
import './ready_go.dart';

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(44),
  ),
  gapPadding: 0.0,
);

class HelpYou extends StatefulWidget {
  static final String sName = "/help/you";

  @override
  _HelpYouState createState() => _HelpYouState();
}

class _HelpYouState extends State<HelpYou> {

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
            getMyTitle(context: context, text: 'Let us know how we'),
            getMyTitle(context: context, text: 'can help you'),
            Container(height: 24.0),
            getMyText(context: context, text: 'You always can change this later'),
            Container(height: 24.0),
            
            MyRadioCard(
              value: 0, 
              onChange: (value) {

              },
            ),
            Container(height: 24.0),
          ],
        ),
        getButton(text: 'Continue', context: context, onTap: () {
          Navigator.of(context).pushNamed(ReadyGo.sName);
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
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getWrapCard('Weight loss', 0),
        Container(height: 16.0),
        _getWrapCard('Better sleeping habbit', 1),
        Container(height: 16.0),
        _getWrapCard('Track my nutrition', 2),
        Container(height: 16.0),
        _getWrapCard('Improve overall fitness', 3),
      ],
    );
  }

  _getWrapCard(text, value) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _getCard(text, value),
      onTap: () {
        widget.onChange(value);
        setState(() {
          _value = value;
        });
      },
    );
  }
  _getCard(text, value) {
    final _width = (MediaQuery.of(context).size.width * 0.8);
    final isCheck = value == _value;

    return Container(
      width: _width,
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getMySubTitle(context: context, text: text),
          getMyRadioIcon(isCheck, context),
        ],
      ),
    );
  }
}
