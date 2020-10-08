import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ghaselk/utils/alert_manager.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/widgets/gradient_button.dart';
import 'package:ghaselk/widgets/profile_header_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double dryCleanRating = 0.0;
  double deliveryRating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff01303a).withOpacity(0.8),
        body: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: dialogContent(context),
        ));
  }

  dialogContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 66.0 + 16.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            margin: EdgeInsets.only(top: 66.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            constraints: BoxConstraints(
                minHeight: size.height, maxHeight: size.height * 1.4),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text("دريب اند دراى",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF023642))),
                        ),
                        Text("""شكرا لاستخدامك تطببيق غسيلك
              برجاء تقييم الطلب  """,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SmoothStarRating(
                                  allowHalfRating: true,
                                  starCount: 5,
                                  rating: 0,
                                  size: 30,
                                  // isReadOnly: true,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  onRated: (value) {
                                    setState(() {
                                      dryCleanRating = value;
                                    });
                                  },
                                  color: Color(0xffFFA200),
                                  borderColor: Color(0xffFFA200),
                                  spacing: 0.0),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '${dryCleanRating.toString()}',
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextField(
                            style: TextStyle(color: Colors.black26),
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(0, 10, 10, 10),
                              hintText: 'اكتب تعليقاً ...',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text("قيم المندوب",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF023642))),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width * .1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                height: size.height * .15,
                                width: size.height * .15,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    "assets/driver_pic.png",
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: blueIconColor,
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Text(
                                        "محمد جابر",
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: blueIconColor,
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Text(
                                        "Chevrolet Aveo",
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 16,
                                          color: const Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SmoothStarRating(
                                  allowHalfRating: true,
                                  starCount: 5,
                                  rating: 0,
                                  size: 30,
                                  // isReadOnly: true,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  onRated: (value) {
                                    setState(() {
                                      deliveryRating = value;
                                    });
                                  },
                                  color: Color(0xffFFA200),
                                  borderColor: Color(0xffFFA200),
                                  spacing: 0.0),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '${deliveryRating.toString()}',
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextField(
                            style: TextStyle(color: Colors.black26),
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(0, 10, 10, 10),
                              hintText: 'اكتب تعليقاً ...',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientButton(
                        gradStart: Color(0xFF023A47),
                        gradEnd: Color(0xFF000C0E),
                        radius: 0,
                        width: size.width * 0.35,
                        height: 40,
                        child: Text(
                          "تقييم",
                          style: TextStyle(color: Colors.white),
                        ),
                        onButtonTap: () {
                          if (deliveryRating == 0.0 || dryCleanRating == 0.0) {
                            alertWithErr(
                                msg: "رجاءاً أكمل التقييم", context: context);
                          } else {
                            Navigator.maybePop(context);
                          }
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        color: Colors.grey,
                        height: 40,
                        minWidth: size.width * 0.35,
                        child: Text(
                          "تخطى",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
                // SizedBox(height: 24.0),
              ],
            ),
          ),
          Positioned(
              left: 16.0,
              right: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black45,
                            spreadRadius: 5)
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 66.0,
                      child: Image.asset(
                        "assets/drip_dry.png",
                        fit: BoxFit.contain,
                        width: 130,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
