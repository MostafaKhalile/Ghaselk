import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghaselk/screens/auth/login.dart';

import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/drawer_item.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final LinearGradient gradieant = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.0),
    colors: [
      const Color(0xff0b809b),
      const Color(0xff022b34),
      const Color(0xff001b21)
    ],
    stops: [0.0, 0.561, 1.0],
  );
  void profilenavigation(BuildContext context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (ctx) => Main_home(3)));
  }

  void notificationnavigation(BuildContext context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (ctx) => Main_home(1)));
  }

  void ordersnavigation(BuildContext context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (ctx) => Main_home(2)));
  }

  void contactnavigation(BuildContext context) async {}

  void logout(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: gradieant),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * .15,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(
                        //   width: size.width * .1,
                        // ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Container(
                            width: size.width * .62,
                            height: size.height * .09,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Color(0xFF014664),
                            ),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: size.width * .15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'مرحبا بك في غسيلك',
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 16,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      'علاء محمد',
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 16,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints.tight(Size(100, 90)),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Positioned(
                            top: 0.0,
                            child: Container(
                              height: size.height * .13,
                              width: size.height * .13,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  "assets/drawer_pic.png",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.greenAccent)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              DrawerItem(
                  Icon(
                    Icons.person_outline,
                    color: Colors.blue,
                    size: 24,
                  ),
                  trs.translate("profile"),
                  profilenavigation),
              DrawerItem(
                  Icon(
                    Icons.notifications,
                    color: Colors.blue,
                    size: 24,
                  ),
                  trs.translate("notifications"),
                  notificationnavigation),
              DrawerItem(
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.blue,
                    size: 24,
                  ),
                  trs.translate("orders"),
                  ordersnavigation),
              DrawerItem(
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 24,
                  ),
                  trs.translate("contact_us"),
                  ordersnavigation),
              DrawerItem(
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.blue,
                    size: 24,
                  ),
                  trs.translate("log_out"),
                  logout)
            ],
          ),
          Positioned(
              top: 17,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 24,
                  ))),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/menuLogo.svg",
                  color: Color(0x47707070).withOpacity(0.30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ' @ all right ghaselk 2020',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 13,
                    color: Color(0x47707070).withOpacity(0.30),
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
