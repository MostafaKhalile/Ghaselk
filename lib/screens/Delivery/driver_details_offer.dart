import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghaselk/screens/Client/order_details.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:ghaselk/widgets/requist_details_widget.dart';
import 'package:ghaselk/widgets/requist_time_location_widget.dart';

class DriverDetailsOffer extends StatefulWidget {
  @override
  _DriverDetailsOfferState createState() => _DriverDetailsOfferState();
}

class _DriverDetailsOfferState extends State<DriverDetailsOffer> {
  TextEditingController pricecontroller;

  void _cancelorder() async {}
  void _confirmOrder(BuildContext context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (_) => OrderDetailsPage()));
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
            "تفاصيل الطلب",
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
                    trs.translate("order_no"),
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
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
                  SvgPicture.asset(
                    "assets/service_type.svg",
                    width: 30,
                  ),
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
                    width: size.width * .5,
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
                RequistDetailsWidget("غسيل عادى", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget("غسيل عادى + كي", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget(
                    "غسيل عادى + كي + تجفيف", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
                RequistDetailsWidget("غسيل جاف ", orderwidgetcolor, "2"),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffF3F3F3),
                ),
              ],
            ),
            RequistTimeLocation(trs.translate("adders_details"), Container()),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .1, vertical: size.width * .05),
              height: size.height * .18,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        trs.translate("from"),
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xff01303a),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .1,
                      ),
                      Text(
                        'حائل، البغدادية الغربية، جدة 22234،',
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xffc1c1c1),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        trs.translate("to"),
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xff01303a),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .1,
                      ),
                      Text(
                        'حائل، البغدادية الغربية، جدة 22234،',
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xffc1c1c1),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              )),
            ),
            RequistTimeLocation(
              trs.translate("drop_time"),
              Container(),
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
            Container(
              height: size.height * .07,
              decoration: BoxDecoration(
                color: const Color(0x1f01262e),
                border: Border.all(width: 1.0, color: const Color(0x1f707070)),
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "عرض السعر",
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: orderwidgetcolor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                  ),
                ],
              ),
              height: size.height * 0.09,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      controller: pricecontroller,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '             00',
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
                      color: unSelectedStarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'SAR',
                    style: const TextStyle(
                      color: unSelectedStarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Image.asset(
                    "assets/flag.png",
                    width: size.width * .08,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ClickedButton(confirm_driver_button, "تأكيد الطلب",
                    size.width * .45, size.height * .07, _confirmOrder),
                ClickedButton(cancel_button_color, "إلغاء الطلب",
                    size.width * .45, size.height * .07, _cancelorder),
              ],
            ),
            SizedBox(
              height: size.height * .06,
            )
          ],
        ),
      ),
    );
  }
}
