import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedOrderType extends StatelessWidget {
  final String title;
  final String imagePath;
  final LinearGradient gradientType;
  final double width;
  final double hight;
  final double imageWidth;
  final double imageHight;
  final double fontSize;
  SelectedOrderType(
      {this.gradientType,
      this.title,
      this.imagePath,
      this.width,
      this.hight,
      this.imageHight,
      this.imageWidth,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      child: Stack(
        children: <Widget>[
          ShaderMask(
            blendMode: BlendMode.luminosity,
            shaderCallback: (Rect bounds) {
              return gradientType.createShader(bounds);
            },
            child: Container(
              width: width,
              height: hight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ghas_kai_type.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: imageHight,
                  width: imageWidth,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: fontSize,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
