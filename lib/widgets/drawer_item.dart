import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function _ontap;
  DrawerItem(this.icon, this.title, this._ontap);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){_ontap(context);},
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'GE SS Two',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
