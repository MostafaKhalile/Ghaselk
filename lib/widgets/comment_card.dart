import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CommentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/drawer_pic.png",
                ),
              ),
            ),
            SizedBox(
              width: size.width * .02,
            ),
            Text(
              'محمد حمزة',
              style: TextStyle(
                fontFamily: 'GE SS Two',
                fontSize: 14,
                color: const Color(0xff02242e),
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: size.width * .17),
                Text(
                  '5.0',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    color: const Color(0xff023641),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: size.width * .01),
                SmoothStarRating(
                    allowHalfRating: false,
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
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: size.width * .1),
          child: Text(
            'عمل رائع الله يعطيكم العافية',
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 13,
              color: const Color(0xff02242e),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Color(0xff707070),
        ),
        SizedBox(
          height: size.height * .05,
        )
      ],
    );
  }
}
