import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import '../widget/my_button.dart';
import '../widget/my_logo.dart';
import '../widget/my_widget.dart';
import './choose_head.dart';

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(44),
  ),
  gapPadding: 0.0,
);

class SignUp extends StatefulWidget {
  static final String sName = "/signup";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        // toolbarOpacity: 0.1,
      ),
      body: _getCloseGesture(
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: _createForm(),
        )
      )
    );
  }

  Widget _getCloseGesture({Widget child}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: child,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }

  Widget _createForm() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _getUsernameWidget(),
                  Container(height: 24.0,),
                  _getPasswordWidget(),
                ],
              )
            ),
            
            Container(height: 48.0,),
            getButton(
              text: 'Continue',
              context: context,
              onTap: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).pushNamed(ChooseHead.sName);
                }
              },
            ),
          ],
        )
      );
  }

  Widget _getUsernameWidget() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'please enter your username';
        }
      },
      autovalidate: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        hintText: 'please enter your username',
        contentPadding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
        border: border,
      ),
    );
  }

  Widget _getPasswordWidget() {
    return TextFormField(
      obscureText: true,
      autovalidate: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'please enter your password';
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
        hintText: 'please enter your password',
        border: border,
      ),
    );
  }
}
