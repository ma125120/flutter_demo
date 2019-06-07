import 'package:flutter/material.dart';

class TextStyleItem extends StatelessWidget {
  const TextStyleItem({
    Key key,
    this.name,
    @required this.style,
    @required this.text,
  }) : assert(style != null),
       assert(text != null),
       super(key: key);

  final String name;
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle nameStyle = theme.textTheme.caption.copyWith(color: theme.textTheme.caption.color);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   width: 72.0,
          //   child: Text(name, style: nameStyle),
          // ),
          Expanded(
            child: Text(text, style: style.copyWith(height: 1.0)),
          ),
        ],
      ),
    );
  }
}