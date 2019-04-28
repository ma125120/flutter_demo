import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './MyProfile.dart';
// import './home/BaseEasy.dart';
import './IconList.dart';
import './HomeTab.dart';
import './AsyncTabs.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    AsyncTabs(),
    IconList(),
    MyProfile(),
    HomeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('主页'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: getBottomBar(),
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(side: BorderSide())
        ),
        notchMargin: 4.0,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget getBottomBar() {
  //   return SizedBox(
  //     height: 56,
  //     child: Row(
  //       children: [
  //         Column(
  //           children: <Widget>[
  //             Icon(Icons.home),
  //             Text('主页'),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.center,
  //         ),
  //         Column(
  //           children: <Widget>[
  //             Icon(Icons.home),
  //             Text('图标'),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.center,
  //         ),
  //         SizedBox(), //中间位置空出
  //         Column(
  //           children: <Widget>[
  //             Icon(Icons.settings),
  //             Text('个人中心'),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.center,
  //         ),
  //         Column(
  //           children: <Widget>[
  //             Icon(Icons.home),
  //             Text('图标'),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.center,
  //         ),
  //       ],
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
  //   ),);
  // }

  Widget getBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('图标')),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('个人中心')),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('tab页')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
