import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghaselk/screens/Client/order_steps.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:ghaselk/widgets/comment_card.dart';
import 'package:ghaselk/widgets/profile_header_widget.dart';
import 'package:ghaselk/widgets/profile_info_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ServiceProfile extends StatefulWidget {
  @override
  _ServiceProfileState createState() => _ServiceProfileState();
}

LinearGradient gradieant = LinearGradient(
  begin: Alignment(0.43, -1.18),
  end: Alignment(1.2, 4.22),
  colors: [const Color(0xff023a47), const Color(0xff000c0e)],
  stops: [0.0, 1.0],
);
void _handlenewrequistnavigation(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => OrderStepper()));
}

class _ServiceProfileState extends State<ServiceProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: ProfileHeaderWidget(
            'assets/home_panner.png',
            'assets/drip_dry.png',
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SvgPicture.asset(
                "assets/washerIcon.svg",
                height: 16,
              ),
            ),
            'دريب اند دراي',
            Icon(Icons.location_on),
            trs.translate("gada-alkhabar"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Stack(children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: size.width * .1, top: 10),
                      width: size.width,
                      height: size.height * .12,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'الخدمات',
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 16,
                              color: const Color(0xffe38257),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/car_wash.svg",
                                color: navyColor,
                              ),
                              SizedBox(
                                width: size.width * .03,
                              ),
                              SvgPicture.asset("assets/mkwa.svg",
                                  color: navyColor),
                            ],
                          )
                        ],
                      ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: size.height * .02,
                          ),
                          Text(
                            'اراء العملاء',
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 16,
                              color: const Color(0xffe38257),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Column(
                            children: [
                              CommentCard(),
                              CommentCard(),
                              CommentCard(),
                            ],
                          ),
                          ClickedButton(
                              Color(0xff3f8708),
                              "اطلب الان",
                              size.width * .85,
                              size.height * .07,
                              _handlenewrequistnavigation),
                          SizedBox(
                            height: size.height * .03,
                          )
                        ],
                      ),
                    ),
                  ])
                ]))))
      ],
    ));
  }
}
