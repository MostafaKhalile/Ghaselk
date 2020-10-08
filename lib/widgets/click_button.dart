import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickedButton extends StatelessWidget {
  final Color color;
  final String title;
  final double width;
  final double hight;
  final Function onClicked;

  ClickedButton(
    this.color,
    this.title,
    this.width,
    this.hight,
    this.onClicked,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
      child: MaterialButton(
        textColor: Colors.white,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'GE SS Two',
            fontSize: 16,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.left,
        ),
        onPressed: () {
          onClicked(context);
        },
      ),
    );
  }
}
