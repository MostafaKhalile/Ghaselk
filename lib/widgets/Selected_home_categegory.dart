import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedHomeCategory extends StatelessWidget {
  final String title;
  final String imagePath;
  final LinearGradient gradientType;
  SelectedHomeCategory(this.title, this.imagePath, this.gradientType);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .2,
      height: size.height * .3,
      child: Container(
        width: size.width * .17,
        height: size.width * .17,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradientType,
          boxShadow: [
            BoxShadow(
              color: const Color(0x59000000),
              offset: Offset(0, 0),
              blurRadius: 6,
            ),
          ],
        ),
        child: InkWell(
          splashColor: Colors.grey, // splash color
          onTap: () {}, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(imagePath), // icon
              SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ), // text
            ],
          ),
        ),
      ),
    );
  }
}
