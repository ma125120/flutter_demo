import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  double width;

  MyLogo({ this.width = 50.0 });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo.png', width: 50.0,);
  }
}