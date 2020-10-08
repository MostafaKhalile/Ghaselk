import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaselk/screens/auth/sign_up.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';

class UserTypePicker extends StatefulWidget {
  final Function onUserTypeChanged;
  UserTypePicker({this.onUserTypeChanged});

  @override
  _UserTypePickerState createState() => _UserTypePickerState();
}

class _UserTypePickerState extends State<UserTypePicker> {
  UserType _currentType = UserType.client;

  Widget buildType({UserType type, Size size, String text}) {
    String icon;
    switch (type) {
      case UserType.client:
        icon = "assets/account.svg";
        break;
      case UserType.driver:
        icon = "assets/van.svg";
        break;
      case UserType.serviceProvider:
        icon = "assets/washer.svg";
        break;
    }
    return InkWell(
        onTap: () {
          setState(() {
            _currentType = type;
            widget.onUserTypeChanged(type);
          });
        },
        child: Container(
          width: size.width * .27,
          height: size.height * .06,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: _currentType == type ? selcetdBorder : unSelcetdBorder,
            ),
            borderRadius: BorderRadius.circular(12),
            color: _currentType == type ? selectedPickerColor : Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black38,
            //     offset: Offset(0, 0),
            //     blurRadius: 17,
            //   ),
            // ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
          ),
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                icon,
                color: _currentType == type ? Colors.white : Colors.black,
                width: size.aspectRatio * 30,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _currentType == type ? Colors.white : Colors.black,
                    fontSize: 14),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);

    return Container(
      height: size.height * 0.06,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Align(
        alignment: trs.locale.languageCode == 'ar'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: ListView(
          scrollDirection: Axis.horizontal,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildType(
                size: size,
                text: trs.translate('agent'),
                type: UserType.client),
            buildType(
                size: size, text: "مقدم خدمة", type: UserType.serviceProvider),
            buildType(
                size: size,
                text: trs.translate('driver'),
                type: UserType.driver),
          ],
        ),
      ),
    );
  }
}
