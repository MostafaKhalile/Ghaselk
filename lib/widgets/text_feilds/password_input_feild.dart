import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';

class PasswordInputFeild extends StatefulWidget {
  final TextEditingController controller;
  final Color backgroundColor;
  final String title;
  PasswordInputFeild({this.controller, this.backgroundColor, this.title});

  @override
  _PasswordInputFeildState createState() => _PasswordInputFeildState();
}

class _PasswordInputFeildState extends State<PasswordInputFeild> {
  bool _obsecure = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            color: widget.backgroundColor,
            height: size.height * 0.07,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    obscureText: _obsecure,
                    textAlign: TextAlign.start,
                    controller: widget.controller,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '*******',
                      contentPadding: EdgeInsets.only(right: 10),
                      hintStyle: const TextStyle(
                        color: unSelectedStarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _obsecure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      _obsecure = !_obsecure;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
