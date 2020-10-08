import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 15 : 10,
      width: isActive ? 15 : 10,
      decoration: BoxDecoration(
        color: isActive ?dismiscolor : orderpicker,
        border: isActive
            ? Border.all(
                color: dismiscolor,
                width: 2.0,
              )
            : Border.all(
                color: Color(0xFFA3A5A8),
                width: 1,
              ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
