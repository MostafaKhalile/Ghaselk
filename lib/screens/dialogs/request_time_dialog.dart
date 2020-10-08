import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghaselk/screens/Client/client_home_page.dart';
import 'package:ghaselk/screens/Client/order_details.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';

class RequestTimeDialog extends StatelessWidget {
  void _confirm(BuildContext context) async {
    navigatorKey.currentState
        .push(CupertinoPageRoute(builder: (_) => OrderDetailsPage()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);
    TextEditingController _controller;

    return Scaffold(
      backgroundColor: Color(0xff01303a).withOpacity(0.8),
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.15, horizontal: 30),
          child: Container(
              padding: EdgeInsets.all(20),
              width: size.width * .90,
              height: size.height * .75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF02313C),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          "assets/calendar.svg",
                          width: 15,
                        ),
                      ),
                      Text(
                        'موعد الاستلام',
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xff01303a),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.close, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                      width: size.width * .80,
                      child: Divider(
                        color: Colors.black,
                        height: 2,
                        thickness: 1,
                      )),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  Text(
                    'يوم',
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: const Color(0xff01303a),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    width: size.width * .58,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0x69707070)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: (size.height * .05) / 5,
                                    right: 10 // HERE THE IMPORTANT PART
                                    ),
                                border: InputBorder.none,
                                hintText: "5-5-2020"),
                            maxLines: 1,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/calendar.svg",
                          width: size.width * .06,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text(
                    'الساعه',
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: const Color(0xff01303a),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: size.width * .68,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0x69707070)),
                    ),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: size.width * .12,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: const Color(0xff1378bb),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        VerticalDivider(
                            width: 2,
                            thickness: 2,
                            color: const Color(0x69707070)),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: (size.height * .05) / 5,
                                    right: 10 // HERE THE IMPORTANT PART
                                    ),
                                border: InputBorder.none,
                                hintText: "5:00"),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text(
                    'العنوان',
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: const Color(0xff01303a),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "من",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 16,
                              color: const Color(0xff01303a),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .07,
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
                            "إلى",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 16,
                              color: const Color(0xff01303a),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .07,
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
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  ClickedButton(Color(0xff023A47), "تأكيد", size.width * .75,
                      size.height * .07, _confirm),
                  SizedBox(
                    height: size.height * .05,
                  )
                ],
              ))),
    );
  }
}
