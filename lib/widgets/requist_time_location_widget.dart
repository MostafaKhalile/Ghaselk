import 'package:flutter/material.dart';

class RequistTimeLocation extends StatelessWidget {
  final String location_details;
  final Widget edit;

  RequistTimeLocation(this.location_details, [this.edit]);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .07,
      decoration: BoxDecoration(
        color: const Color(0x1f01262e),
        border: Border.all(width: 1.0, color: const Color(0x1f707070)),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.location_on),
          SizedBox(
            width: 5,
          ),
          Text(
            location_details,
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 14,
              color: const Color(0xff023a47),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: size.width * .4,
          ),
          edit
        ],
      ),
    );
  }
}
