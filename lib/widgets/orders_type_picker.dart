import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaselk/screens/auth/sign_up.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/enums.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';

class Orders_type_picker extends StatefulWidget {
  final Function onorderTypeChanged;
  Orders_type_picker({this.onorderTypeChanged});

  @override
  _Orders_type_pickerState createState() => _Orders_type_pickerState();
}

class _Orders_type_pickerState extends State<Orders_type_picker> {
  orderstype _currentType = orderstype.waiting;

  Widget buildType({orderstype type, String text}) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          _currentType = type;
          widget.onorderTypeChanged(type);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: _currentType == type ? Colors.transparent : selcetdBorder,
          ),
          color:
              _currentType == type ? Colors.transparent : unselectedorderpicker,
        ),
        width: size.width * (1 / 3),
        height: size.height * .06,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 20,
              color: const Color(0xff02323d),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);

    return Container(
      height: size.height * 0.06,
      child: Align(
        alignment: trs.locale.languageCode == 'ar'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildType(text: "قيد الإنتظار", type: orderstype.waiting),
            buildType(text: "قيد التنفيذ", type: orderstype.workingon),
            buildType(text: "تمت", type: orderstype.done),
          ],
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
