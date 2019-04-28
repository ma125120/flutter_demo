import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../pages/TodoDetail.dart';

class Todo extends StatelessWidget {
  final String title;
  final String description;

  Todo(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
        )
      ),
      child: Row(
        children: <Widget>[
          Image.network('https://fuss10.elemecdn.com/8/a0/d56a89fe06282b004380344268fb9jpeg.jpeg?imageMogr/format/webp/thumbnail/!140x140r/gravity/Center/crop/40x40/'),
          Expanded(
            child:Container(
              padding: EdgeInsets.only(left: 12.0),
              child: Column(
                children: <Widget>[
                  Text(title),
                  Text(description)
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
            
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}