import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';

class InputTextFeild extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final IconData prefixIcon;
  final String hintText;
  final String title;
  final Widget child;
  final TextInputType inputType;
  final bool isPhone;
  InputTextFeild(
      {@required this.controller,
      @required this.hintText,
      @required this.title,
      @required this.icon,
      this.prefixIcon,
      this.child,
      this.isPhone = false,
      this.inputType = TextInputType.text});
  @override
  _InputTextFeildState createState() => _InputTextFeildState();
}

class _InputTextFeildState extends State<InputTextFeild> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: blueIconColor,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Directionality(
            textDirection:
                widget.isPhone ? TextDirection.ltr : TextDirection.rtl,
            child: Container(
              height: size.height * .06,
              child: TextField(
                style: TextStyle(color: Colors.black),
                textAlign: widget.isPhone ? TextAlign.center : TextAlign.start,
                controller: widget.controller,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                  filled: true,
                  
                  hintStyle: TextStyle(fontSize: 15),
                  hintText: widget.hintText,
                  prefixIcon: widget.child,
                  suffixIcon: Icon(
                    widget.prefixIcon,
                    color: blueIconColor,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: blueBorder, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueBorder, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
