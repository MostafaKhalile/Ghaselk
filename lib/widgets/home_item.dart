import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghaselk/screens/Client/services_profile.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeItem extends StatelessWidget {
  final String location;
  final String imagePath;
  final String cartype;
  HomeItem(this.location, this.imagePath, this.cartype);

  void _contactdriver(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => ServiceProfile()));
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: size.width * .45,
          height: size.height * .25,
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
                height: size.height * .01,
              ),
              Container(
                width: size.width * .2,
                height: size.width * .2,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x42707070)),
                    borderRadius: BorderRadius.circular(100)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: blueIconColor,
                    size: 20,
                  ),
                  // SizedBox(
                  //   width: size.width * .02,
                  // ),
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
              SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: 5,
                  size: 15,
                  isReadOnly: true,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star,
                  color: Color(0xffFFA200),
                  borderColor: Color(0xffFFA200),
                  spacing: 0.0),
            ],
          ),
        ),
        ClickedButton(itemOrderBackground, trs.translate("contact_now"),
            size.width * .45, size.height * .06, _contactdriver)
      ],
    );
  }
}
