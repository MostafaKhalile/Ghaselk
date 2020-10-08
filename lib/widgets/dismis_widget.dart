import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';

class DismisWidget extends StatelessWidget {
  final int notificationid;
  final bool read;
  final String imagepath;
  final String notificationtitle;
  final String notificationdetails;
  final String notificationdate;
  DismisWidget(this.notificationid, this.imagepath, this.notificationtitle,
      this.notificationdetails, this.notificationdate, this.read);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * .025),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: dismiscolor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: size.width * .1,
          ),
          alignment: Alignment.centerLeft,
          // padding: EdgeInsets.only(left: size.width * .05),
        ),
        direction: DismissDirection.endToStart,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
          ),
          width: size.width * .95,
          height: size.height * .11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: read ? Color(0xffffffff) : Color(0xFFE6F8F2),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width),
                ),
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: size.width * .15,
                  width: size.width * .15,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      imagepath,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    notificationtitle,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 14,
                      color: const Color(0xff02323d),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    notificationdetails,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 12,
                      color: const Color(0xff707070),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * .06,
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: size.height * .02),
                    child: Text(
                      notificationdate,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 13,
                        color: const Color(0xff023a47),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
