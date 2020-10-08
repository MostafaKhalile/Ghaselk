import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:ghaselk/widgets/requist_details_widget.dart';
import 'package:ghaselk/widgets/requist_time_location_widget.dart';

import 'Client/available_deiver.dart';

class RequistDetails extends StatefulWidget {
  @override
  _RequistDetailsState createState() => _RequistDetailsState();
}

class _RequistDetailsState extends State<RequistDetails> {
  void _handeleditlocation() async {}
  void _handeledittime() async {}
  void _handeleditorder() async {}
  void _handlepickdriverscreen(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => AvailableDriver()));
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: darkBlue,
          centerTitle: true,
          title: Text(
            trs.translate("order_details"),
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 20,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * .07,
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                border: Border.all(width: 1.0, color: const Color(0x1f707070)),
              ),
              padding: EdgeInsets.only(right: size.width * .101),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "1358",
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .51,
                  ),
                  InkWell(
                    onTap: _handeleditorder,
                    child: Container(
                      child: Text(
                        "تعديل الطلب",
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 14,
                          color: lableColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * .07,
              decoration: BoxDecoration(
                color: darkgrey,
                border: Border.all(width: 1.0, color: const Color(0x1f707070)),
              ),
              padding: EdgeInsets.only(right: size.width * .101),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/service_type.svg",width: 30,),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Text(
                    trs.translate("services_type"),
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .44,
                  ),
                  Text(
                    trs.translate("quntity"),
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                RequistDetailsWidget(
                   "غسيل عادى", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget(
                   "غسيل عادى + كي", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget("غسيل عادى + كي + تجفيف",
                    orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget(
                    "غسيل جاف ", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
              ],
            ),
            RequistTimeLocation(
             "تفاصيل العنوان",
              InkWell(
                onTap: _handeleditlocation,
                child: Container(
                  child: Text(
                    "تعديل العنوان",
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: lableColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * .09,
              child: Center(
                child: Text(
                  'حائل، البغدادية الغربية، جدة 22234، المملكة العربية السعودية',
                  style: TextStyle(
                    fontFamily: 'GE SS Two',
                    fontSize: 15,
                    color: const Color(0xffc1c1c1),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            RequistTimeLocation(
              "توقيت التوصيل",
              InkWell(
                onTap: _handeledittime,
                child: Container(
                  child: Text(
                    "تعديل الموعد",
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: lableColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * .1, right: size.width * .1),
              height: size.height * .09,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '12  شوال',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: const Color(0xff404040),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '5:00 pm',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: const Color(0xff404040),
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  ClickedButton(
                      Color(0xff023A47),
                      trs.translate("pick_driver"),
                      size.width * .75,
                      size.height * .07,
                      _handlepickdriverscreen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
