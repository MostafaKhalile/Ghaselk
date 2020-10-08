import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';

class PhoneInpitFeild extends StatelessWidget {
  final TextEditingController controller;
  final Color backgroundColor;
  PhoneInpitFeild({this.controller, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.phone_android,
                color: Colors.white,size: 18,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                trs.translate('phone_no'),
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
            color: backgroundColor,
            height: size.height * 0.07,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '56123456',
                      contentPadding: EdgeInsets.only(right: 10),
                      hintStyle: const TextStyle(
                        color: unSelectedStarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '|',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '966+',
                  style: const TextStyle(
                    color: unSelectedStarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
