import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghaselk/models/order_state.dart';
import 'package:ghaselk/screens/dialogs/rating_dialog.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/widgets/app_drawer.dart';
import 'package:ghaselk/widgets/requist_details_widget.dart';
import 'client_home_page.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  int currentStep = 0;
  List<OrderState> states = List();

  @override
  void initState() {
    // TODO: implement initState
    states = statesArrayList;
    currentStep = 0;
    super.initState();
  }

  bool isWhite(int state) {
    if (state <= currentStep) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          centerTitle: true,
          title: Text(
            "تفاصيل الطلب",
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 20,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w300,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => mainScaffoldKey.currentState.openDrawer(),
          ),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 25,
                          right: 25,
                          child: Text(
                            "طلب رقم :1358 ",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 14,
                              color: const Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                states[currentStep].imagePath,
                                width: size.width * 0.7,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  states[currentStep].title,
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    color: const Color(0xff023a47),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: icons(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
            currentStep == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: MaterialButton(
                      onPressed: () {
                        next(context);
                      },
                      child: Text(
                        "تأكيد الاستلام",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF106E85),
                      height: 50,
                      minWidth: size.width * 0.85,
                    ),
                  )
                : Container(),
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsetsDirectional.only(bottom: 20),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          InfoHeader(
                            icon: SvgPicture.asset(
                              "assets/service_type.svg",
                              width: 30,
                            ),
                            title: "نوع الخدمة",
                            subTitle: "الكمية",
                            fontfamily: "GE SS Two",
                          ),
                          Column(
                            children: <Widget>[
                              RequistDetailsWidget(
                                  "غسيل عادى", orderwidgetcolor, "2"),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF3F3F3),
                              ),
                              RequistDetailsWidget(
                                  "غسيل عادى + كي", orderwidgetcolor, "2"),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF3F3F3),
                              ),
                              RequistDetailsWidget("غسيل عادى + كي + تجفيف",
                                  orderwidgetcolor, "2"),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF3F3F3),
                              ),
                              RequistDetailsWidget(
                                  "غسيل جاف ", orderwidgetcolor, "2"),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF3F3F3),
                              ),
                            ],
                          ),
                          InfoHeader(
                            icon: Container(),
                            title: "التكلفة",
                            subTitle: "100 SAR",
                            fontfamily: "Arial",
                          ),
                          Column(children: <Widget>[
                            RequistDetailsWidget(
                                "توصيل ", orderwidgetcolor, "10 SAR"),
                            Divider(
                              height: 2,
                              thickness: 2,
                              color: Color(0xffF3F3F3),
                            ),
                            RequistDetailsWidget(
                                "الإجمالى", orderwidgetcolor, "110 SAR"),
                          ]),
                          InfoHeader(
                            icon: SvgPicture.asset(
                              "assets/calendar.svg",
                              color: blueIconColor,
                            ),
                            title: "ميعاد الإستلام",
                            subTitle: "",
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width * .1, right: size.width * .1),
                            height: size.height * .09,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '12  شوال',
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 16,
                                    color: const Color(0xff404040),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '5:00 pm',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16,
                                    color: const Color(0xff404040),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: orderDetailsFooter()),
                          ),
                        ],
                      ),
                    )))
          ],
        ));
  }

  next(BuildContext context) {
    setState(() {
      currentStep < states.length - 1 ? currentStep++ : null;
    });
  }

  prev(BuildContext context) {
    setState(() {
      currentStep > 0 ? currentStep-- : null;
    });
  }

  List<Widget> orderDetailsFooter() {
    final size = MediaQuery.of(context).size;
    List<Widget> children = List();
    if (currentStep == 0) {
      children = <Widget>[
        RaisedButton(
          color: greenButton,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "اتصل بالمندوب",
                style: TextStyle(color: Colors.white),
              )),
          // minWidth: size.width * 0.3,
          // height: 40,
          onPressed: () {
            next(context);
          },
        ),
        SizedBox(
          width: 30,
        ),
        RaisedButton(
          color: Colors.grey,
          // minWidth: size.width * 0.3,
          // height: 40,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "إلغاء الطلب",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: prev(context),
        ),
      ];
    } else if (currentStep == 1) {
      children = <Widget>[
        RaisedButton(
          color: greenButton,
          child: SizedBox(
            height: 50,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                "اتصل بالمندوب",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            next(context);
          },
        )
      ];
    } else if (currentStep == 3) {
      children = <Widget>[
        RaisedButton(
          color: greenButton,
          child: SizedBox(
            height: 50,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                "تم استلام الطلب",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            _showdialog(context);
          },
        )
      ];
    } else {
      children = <Widget>[
        RaisedButton(
          color: greenButton,
          child: SizedBox(
            height: 50,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                "الخطوة التالية",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            next(context);
          },
        )
      ];
    }
    return children;
  }

  LinearGradient activeGradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xFFF99746), const Color(0xFFD64900)],
    stops: [0.0, 1.0],
  );
  LinearGradient doneGradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xFF023A47), const Color(0xFF000C0E)],
    stops: [0.0, 1.0],
  );
  LinearGradient upcomingGradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xFFD5D9DA), const Color(0xFFD5D9DA)],
    stops: [0.0, 1.0],
  );

  List<Widget> icons() {
    List<Widget> list = List();
    //i<5, pass your dynamic limit as per your requirment
    for (int i = 0; i < states.length; i++) {
      LinearGradient stepGradient;
      if (i < currentStep) {
        stepGradient = doneGradieant;
      } else if (i == currentStep) {
        stepGradient = activeGradieant;
      } else {
        stepGradient = upcomingGradieant;
      }
      list.add(Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(
              states[i].iconPath,
              width: 5,
              color: isWhite(i) ? Colors.white : darkBlue,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 0),
                blurRadius: 8,
              ),
            ], shape: BoxShape.circle, gradient: stepGradient),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              states[i].subTitle,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ));
    }
    return list;
  }
}

_showdialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return RatingDialog();
      });
}

class InfoHeader extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subTitle;
  final String fontfamily;

  const InfoHeader(
      {Key key, this.icon, this.title, this.subTitle, this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .07,
      decoration: BoxDecoration(
        color: darkgrey,
        border: Border.all(width: 1.0, color: const Color(0x1f707070)),
      ),
      padding: EdgeInsets.symmetric(horizontal: size.width * .101),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          icon,
          Text(
            title,
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 14,
              color: const Color(0xff023a47),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: size.width * .44,
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontFamily: fontfamily,
              fontSize: 14,
              color: const Color(0xff023a47),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
