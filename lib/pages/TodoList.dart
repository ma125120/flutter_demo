
import 'package:flutter/material.dart';
import '../components/Todo.dart';
import './TodoDetail.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  final ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels
          >= _scrollController.position.maxScrollExtent - 100) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List todos = List.generate(
    10,
    (i) => i,
  );
  bool isLoadMore = false;

  _TodoList();

  _getData() {
    todos = List.generate(
      10,
      (i) => i,
    );
  }

  Future _getMoreData() async {
    if (!isLoadMore) {
      isLoadMore = true;
      var lists = List.generate(
        5,
        (i) => i,
      );
      todos.addAll(lists);
      setState(() {

      });
      await Future.delayed(Duration(seconds: 2), () {
        isLoadMore = false;
        setState(() {

        });
      });
    }
  }

  int _getListLength() {
    var len = todos.length;
    if (isLoadMore) {
      len += 1;
    }
    return len;
  }

  Widget _renderFooter() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Container(width: 20),
          Text('加载中...'),
        ],
      ),
    );
  }

  Widget _renderListItem(context, index) {
    if (isLoadMore && index == todos.length) {
      return _renderFooter();
    }

    var _todo = Todo(
      '列表项: $index',
      '描述部分: $index',
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetail(todo: _todo),
          ),
        );
      },
      child: _todo,
    );
  }

  Widget _listBody() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _getListLength(),
      itemBuilder: _renderListItem,
    );
  }

  Widget _wrapRefresh() {
    return RefreshIndicator(
      child: _listBody(),
      onRefresh: () {
        _getData();
        return Future.value(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: _wrapRefresh(),
      )
    );
  }
}
