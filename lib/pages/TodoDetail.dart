import '../components/Todo.dart';
import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  TodoDetail({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            todo,
            Image.network('http://seopic.699pic.com/photo/40007/5928.jpg_wh1200.jpg')
          ],
        )
      ),
    );
  }
}