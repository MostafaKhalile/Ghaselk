import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String header_pic;
  final String driver_pic;
  final Widget profile_type;
  final String name;
  final Icon icon_profile_type;
  final String locatin_cartype;
  final Widget rate;
  ProfileHeaderWidget(this.header_pic, this.driver_pic, this.profile_type,
      this.name, this.icon_profile_type, this.locatin_cartype,
      [this.rate]);
  LinearGradient gradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xff023a47), const Color(0xff000c0e)],
    stops: [0.0, 1.0],
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradieant.createShader(bounds);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(header_pic), fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          height: size.height * .3,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                height: size.height * .15,
                width: size.height * .15,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    driver_pic,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .07,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      profile_type,
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 18,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: blueIconColor,
                      ),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        locatin_cartype,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 16,
                          color: const Color(0xffaaaaaa),
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
//                  Row(
//                    children: <Widget>[
//                      SmoothStarRating(
//                          allowHalfRating: false,
//                          starCount: 5,
//                          rating: 5,
//                          size: 25,
//                          isReadOnly: true,
//                          filledIconData: Icons.star,
//                          halfFilledIconData: Icons.star,
//                          color: Color(0xffFFA200),
//                          borderColor: Color(0xffFFA200),
//                          spacing: 0.0),
//                      SizedBox(width: size.width * .02),
//                      Text(
//                        '5.0',
//                        style: TextStyle(
//                          fontFamily: 'Arial',
//                          fontSize: 14,
//                          color: const Color(0xffffffff),
//                        ),
//                      )
//                    ],
//                  )
                  rate
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
