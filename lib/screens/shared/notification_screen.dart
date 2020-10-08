import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/screens/Client/client_home_page.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/app_drawer.dart';
import 'package:ghaselk/widgets/dismis_widget.dart';
import '../../widgets/app_drawer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

int notification_id;

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        centerTitle: true,
        title: Text(
          trs.translate("notifications"),
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
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Positioned(
              top: 10,
              left: 10,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.only(right: size.width * .7),
                  child: Text(
                    "حذف الكل",
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 15,
                      color: blueIconColor,
                    ),
                  ),
                ),
              )),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsetsDirectional.only(top: size.width * 0.1),
            child: Column(
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  spacing: 2,
                  children: <Widget>[
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        false),
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        false),
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        false),
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        true),
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        true),
                    DismisWidget(
                        notification_id,
                        "assets/drip_dry.png",
                        "دريب اند دري استلم الطلب الخاص بك",
                        "سوف يتم الرد عليك بالسعر في اقرب وقت",
                        "12 مارس",
                        true)
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
