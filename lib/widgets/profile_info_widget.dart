import 'package:flutter/material.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
class Profile_info_widget extends StatelessWidget {
  final double hight;
  final Widget location;
  Profile_info_widget(this.hight,[this.location]);
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs=AppTranslations.of(context);
    final size =MediaQuery.of(context).size;
    return  Container(
      padding: EdgeInsets.only(right: size.width * .1),
      width: size.width,
      height: hight,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            // offset: Offset(0, 0),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            SizedBox(
                            height: size.height * .02,
                          ),
          Text(
            trs.translate("informations"),
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 16,
              color: const Color(0xffe38257),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.phone_android,
                color: Colors.blue,
              ),
              SizedBox(
                width: size.width * .02,
              ),
              Text(
                '+966 6512345689',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff023641),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.blue,
              ),
              SizedBox(
                width: size.width * .02,
              ),
              Text(
                'info@dryanddrip.com',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff023641),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
         location
        ],
      ),
    );
  }
}
