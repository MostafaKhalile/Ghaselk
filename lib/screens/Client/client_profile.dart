import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/profile_header_widget.dart';
import 'package:ghaselk/widgets/profile_info_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'client_home_page.dart';

class ClientProfile extends StatefulWidget {
  @override
  _ClientProfileState createState() => _ClientProfileState();
}

LinearGradient gradieant = LinearGradient(
  begin: Alignment(0.43, -1.18),
  end: Alignment(1.2, 4.22),
  colors: [const Color(0xff023a47), const Color(0xff000c0e)],
  stops: [0.0, 1.0],
);
void _handlenewrequistnavigation() async {}

class _ClientProfileState extends State<ClientProfile> {
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
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => mainScaffoldKey.currentState.openDrawer(),
          ),
        ),

        // drawer: AppDrawer(),
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
                    children: [
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
                      Text(
                        "5.0",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * .01,
                width: size.width,
              ),
              SizedBox(
                height: size.height * .006,
              ),
              Profile_info_widget(
                size.height * .3,
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'حائل، البغدادية الغربية، جدة 22234، المملكة العربية السعودية',
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 14,
                          color: const Color(0xff011728),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
            Container(
                padding: EdgeInsets.only(
                    right: size.width * .87, top: size.height * .03),
                child: InkWell(
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 34,
                  ),
                )),
          ],
        )));
  }
}
