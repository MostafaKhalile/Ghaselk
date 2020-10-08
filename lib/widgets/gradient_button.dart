import 'package:flutter/material.dart';

typedef ButtonTapCallback = void Function();

class GradientButton extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  final Color gradStart;
  final Color gradEnd;
  final Widget child;
  final ButtonTapCallback onButtonTap;
  GradientButton({
    @required this.radius,
    @required this.height,
    this.width,
    @required this.gradStart,
    @required this.gradEnd,
    @required this.child,
    @required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: RaisedButton(
        onPressed: onButtonTap,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(radius != null ? radius : 80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: onButtonTap == null
                  ? LinearGradient(
                      colors: [Colors.grey[200], Colors.grey[500]],
                        begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    )
                  : LinearGradient(
                      colors: [gradStart, gradEnd],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      stops: [0.02,0.8]
                    ),
              borderRadius:
                  BorderRadius.circular(radius != null ? radius : 30.0)),
          child: Container(
            constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
