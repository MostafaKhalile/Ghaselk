import 'package:flutter/material.dart';
import 'package:ghaselk/models/notification.dart';
import 'package:ghaselk/utils/colors.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({Key key, this.notification}) : super(key: key);
  Widget newLabel() {
    if (notification.readAt == null) {
      return Row(children: <Widget>[
        Container(
            decoration: new BoxDecoration(
                color: blueIconColor,
                borderRadius: new BorderRadius.all(const Radius.circular(8.0))),
            child: Center(
              child: Text(
                "جديد",
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: 80,
            height: 20),
      ]);
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
        color: notification.readAt == null ? Color(0xFFFDFFE7) : Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              isThreeLine: true,
              leading: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: size.height * .1,
                  width: size.height * .1,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/drip_dry.png",
                    ),
                  )),
              title: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        notification.time + notification.date,
                        style: TextStyle(
                            fontFamily: 'GE SS Two', color: Colors.black),
                      ),
                    ],
                  )),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        notification.title + "\n"+ notification.body,
                        style: TextStyle(
                            color: Color(0xFF02323D),
                            fontSize: 16,
                            fontFamily: "GE SS Two"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
