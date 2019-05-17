import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.color,
    this.isLinear = false,
    this.width,
    this.height = 44.0,
    this.onTap,
    this.radius,
    this.shadow,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;
  final Color color;

  final double radius;
  final BoxShadow shadow;

  final bool isLinear;

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
        color: isLinear ? null : color,
        gradient: isLinear ? LinearGradient(colors: _colors) : null,
        borderRadius: BorderRadius.circular(radius ?? 3.0), //3像素圆角
        boxShadow: [ //阴影
          shadow ?? BoxShadow(
            color:Colors.black54,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0
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