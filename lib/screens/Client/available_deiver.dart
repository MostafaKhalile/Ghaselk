import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';

import 'package:ghaselk/widgets/driver_item.dart';

class AvailableDriver extends StatefulWidget {
  @override
  _AvailableDriverState createState() => _AvailableDriverState();
}

class _AvailableDriverState extends State<AvailableDriver> {
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: darkBlue,
            centerTitle: true,
            title: Text(
              "المندوب المتاح",
              style: TextStyle(
                fontFamily: 'GE SS Two',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
            )),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
            top: size.height * .05,
            right: size.width * .025,
            left: size.width * .025,
          ),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: size.width * .05,
            runSpacing: 20,
            children: <Widget>[
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo"),
              DriverItem(trs.translate("gada-alkhabar"),
                  "assets/driver_pic.png", "Chevrolet aveo")
            ],
          ),
        )));
  }
}
