import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghaselk/screens/dialogs/request_time_dialog.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DriverItem extends StatelessWidget {
  final String location;
  final String imagePath;
  final String cartype;
  DriverItem(this.location, this.imagePath, this.cartype);

  void _confirm(BuildContext context) async {
    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Requist_details_price()));
  }

  show_dialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RequestTimeDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: size.width * .45,
          height: size.height * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
            color: const Color(0xffffffff),
            border: Border.all(width: 1.0, color: const Color(0x42707070)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                height: size.width * .25,
                width: size.width * .25,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    imagePath,
                    height: size.width * .25,
                    width: size.width * .25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    color: blueIconColor,
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Text(
                    cartype,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          width: size.width * .45,
          height: size.height * .06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: driverclickbutton,
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: MaterialButton(
            textColor: Colors.white,
            child: Text(
              trs.translate("contact_now"),
              style: TextStyle(
                fontFamily: 'GE SS Two',
                fontSize: 16,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              show_dialog(context);
              _confirm(context);
            },
          ),
        )
      ],
    );
  }
}
