import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../models/UserInfo.dart';
import 'package:flutter/cupertino.dart';

class ProvidePage extends StatefulWidget {

  @override
  _ProvidePageState createState() => _ProvidePageState();
}

class _ProvidePageState extends State<ProvidePage> {
  String _name;

  @override
  Widget build(BuildContext context) {
    final currentUserInfo = Provide.value<UserInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Provide<UserInfo>(
          builder: (context, child, userinfo) => Text('用户名：${userinfo.name}'),
        ),
        StreamBuilder<UserInfo>(
          initialData: currentUserInfo,
          stream: Provide.stream<UserInfo>(context)
              .where((userinfo) => userinfo.name != ''),
          builder: (context, snapshot) =>
              Text('不为空的用户名: ${snapshot.data.name}')),
        Container(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (name) {
              setState(() {
                _name = name;
              });
            },
          ),
        ),
        CupertinoButton.filled(
          child: Text('改变name'),
          onPressed: () {
            currentUserInfo.setName(_name);
          },
        )
      ],
    );
  }
}