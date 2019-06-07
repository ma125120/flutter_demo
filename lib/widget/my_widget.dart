import 'package:flutter/material.dart';
import './my_button.dart';

Widget getButton({ onTap, String text, BuildContext context, }) {
  final width = MediaQuery.of(context).size.width;

  return MyButton(
    color: Theme.of(context).primaryColor, 
    child: Text(text, style: TextStyle(fontSize: 16.0),),
    radius: 50.0, 
    width: width * 0.8,
    height: 50.0,
    onTap: onTap,
  );
}

Widget getMyTitle({ String text, BuildContext context, }) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final tilteStyle = textTheme.headline.copyWith(fontSize: 28.0);

  return Text(text, style: tilteStyle);
}

Widget getMySubTitle({ String text, BuildContext context, }) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final tilteStyle = textTheme.headline.copyWith(fontSize: 16.0);

  return Text(text, style: tilteStyle);
}

Widget getMyText({ String text, BuildContext context, }) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final tilteStyle = textTheme.caption.copyWith(fontSize: 16.0, color: Color(0xFF999999));

  return Text(text, style: tilteStyle);
}

Widget getMyRadioIcon(bool isCheck, BuildContext context) {
  return ClipOval(
    child: isCheck ? Container(
      width: 24.0,
      height: 24.0,
      color: Theme.of(context).primaryColor,
      child: Icon(Icons.check, color: Colors.white, size: 20.0),
    ) : Container(
      width: 24.0,
      height: 24.0,
      color: Colors.grey[100],
    ),
  );
}