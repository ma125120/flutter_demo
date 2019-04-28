import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './MyProfile.dart';
import './WebviewDemo.dart';
import './TodoList.dart';
import './IconList.dart';
import './HomeTab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    HomeTab(),
    IconList(),
    WebviewDemo(),
    // MyWebview(url: 'http://192.168.1.15:8080',),
    // MyProfile(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('图标')),
          BottomNavigationBarItem(icon: Icon(Icons.computer), title: Text('网页')),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('个人中心')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
