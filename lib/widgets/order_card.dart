import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ghaselk/utils/colors.dart';

class OrderCard extends StatelessWidget {
  final String date;
  final String type;
  final String imagepath;
  final String providerName;
  final String location;
  final String service_type;
  final Function onClicked;

  OrderCard(this.date, this.type, this.imagepath, this.providerName,
      this.location, this.service_type, this.onClicked);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onClicked,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: size.width * .08, right: size.width * .08),
                width: size.width * .85,
                height: size.height * .06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: orderheaderitemcolor,
                  border:
                      Border.all(width: 1.0, color: const Color(0x47707070)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 8),
                width: size.width * .85,
                height: size.height * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: orderwidgetcolor,
                  border:
                      Border.all(width: 1.0, color: const Color(0x47707070)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width),
                      ),
                      child: Container(
                        height: size.width * .20,
                        width: size.width * .20,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            imagepath,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: SvgPicture.asset(
                                "assets/washerIcon.svg",
                                height: 16,
                              ),
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Text(
                              providerName,
                              style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: blueIconColor,
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/iron.svg",
                              color: blueIconColor,
                              height: 20,
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Container(
                              width: size.width * 0.5,
                              child: Text(
                                service_type,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
