import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onTap,
    this.radius,
    this.shadow,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  final double radius;
  final BoxShadow shadow;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;

  //点击回调
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: BorderRadius.circular(radius ?? 3.0), //3像素圆角
        boxShadow: [ //阴影
          shadow ?? BoxShadow(
            color:Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
          )
        ]
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          // splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}