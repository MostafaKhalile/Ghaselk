import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/profile_header_widget.dart';
import 'package:ghaselk/widgets/profile_info_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DriverProfile extends StatefulWidget {
  @override
  _DriverProfileState createState() => _DriverProfileState();
}

// void _handlenewrequistnavigation() async {}

class _DriverProfileState extends State<DriverProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: darkBlue,
            centerTitle: true,
            title: Text(
              trs.translate("profile"),
              style: TextStyle(
                fontFamily: 'GE SS Two',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
            )),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
              ProfileHeaderWidget(
                  "assets/driver_header_pic.png",
                  'assets/driver_pic.png',
                  Icon(
                    Icons.person,
                    color: blueIconColor,
                  ),
                  "محمد جابر",
                  Icon(Icons.directions_car),
                  trs.translate("gada-alkhabar"),
                  Row(
                    children: <Widget>[
                      SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: 5,
                          size: 25,
                          isReadOnly: true,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star,
                          color: Color(0xffFFA200),
                          borderColor: Color(0xffFFA200),
                          spacing: 0.0),
                      SizedBox(width: size.width * .02),
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * .01,
                width: size.width,
              ),
              SizedBox(
                height: size.height * .006,
              ),
              Profile_info_widget(size.height * .17, Container()),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                padding: EdgeInsets.only(
                    right: size.width * .1, left: size.width * .1),
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          trs.translate("car_data_section"),
                          style: TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 16,
                            color: const Color(0xffe38257),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Text(
                              'Chevorlet aveo',
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
                            Container(
                              height: size.width * .22,
                              width: size.width * .4,
                              child: Image.asset(
                                "assets/car_back_pic.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              height: size.width * .22,
                              width: size.width * .4,
                              child: Image.asset(
                                "assets/car_Front_pic.png",
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .08,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            Container(
                padding: EdgeInsets.only(
                    right: size.width * .87, top: size.height * .03),
                child: InkWell(
                  child: Image.asset("assets/Setting_icon.png"),
                )),
          ],
        )));
  }
}
