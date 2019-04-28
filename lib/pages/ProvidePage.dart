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

  Widget _hybridGridRow() {
    return Row(children: <Widget>[
      Expanded(
        // height: 200.0,
        // width: 200.0,
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 2.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: <Widget>[
            _gridItem(),
            _gridItem(),
            _gridItem(),
            _gridItem(),
          ],
        ),
      ),

      Container(
        width: 100.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
      ),
    ],);
  }

  Widget _gridItem() {
    return Column(children: <Widget>[
      Icon(Icons.home, color: Colors.blue),
      Text('主页'),
    ],);
  }

  Widget _getListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder:(BuildContext context, int index) {
        return Container(
          width: 100.0,
          padding: EdgeInsets.only(right: 20.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png',
                fit: BoxFit.cover,
              ),
              Container(height: 8.0),
              Text('列表项$index'),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: _getColumn(),
      ),
    );
  }

  Widget _getColumn() {
    final currentUserInfo = Provide.value<UserInfo>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
        _hybridGridRow(),
        _hybridGridRow(),
        _hybridGridRow(),

        Text('今日特价：', style: TextStyle(
          fontSize: 20.0,

        )),

        Container(
          child: _getListView(),
          height: 200.0,
          padding: EdgeInsets.all(20.0),
        ),

      ],
    );
  }
}