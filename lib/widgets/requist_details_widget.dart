import 'package:flutter/material.dart';
class RequistDetailsWidget extends StatelessWidget {
  final Color containercolor;
  final String service_type ;
  final String type;
  RequistDetailsWidget(this.service_type,this.containercolor,this.type);
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size ;
    return Container( padding: EdgeInsets.only(right: size.width * .101,
        left: size.width*.148),
      width: size.width,
      height: size.height*.06,
      decoration: BoxDecoration(
        color: containercolor,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Text(
            service_type,
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 14,
              color: const Color(0xff023a47),
              fontWeight: FontWeight.w300,
            ),
          ),

          Text(
            type,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ), textAlign: TextAlign.right,
          ),
        ],
      ),


    );
  }
  }