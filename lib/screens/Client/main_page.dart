import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/Selected_home_categegory.dart';
import 'package:ghaselk/widgets/app_drawer.dart';
import 'package:ghaselk/widgets/Home_item.dart';
import 'client_home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  LinearGradient gradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xff023a47), const Color(0xff000c0e)],
    stops: [0.0, 1.0],
  );
  LinearGradient carGradient = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.09, 1.87),
    colors: [ Color(0xff9E4098),  Color(0xff4F204C)],
    stops: [0.0, 1.0],
  );
  LinearGradient carpetGradiant = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.09, 1.87),
    colors: [ Color(0xff783093),  Color(0xff3c184a)],
    stops: [0.0, 1.0],
  );
  LinearGradient clothesGradiant = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.97),
    colors: [ Color(0xff645ca9),  Color(0xff322e55)],
    stops: [0.0, 1.0],
  );
  LinearGradient ironGradiant = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.95),
    colors: [ Color(0xff4066b1),  Color(0xff203359)],
    stops: [0.0, 1.0],
  );
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        drawer: AppDrawer(),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return gradieant.createShader(bounds);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/home_panner.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsetsDirectional.only(top: size.height * 0.05),
                      child: SingleChildScrollView(
                          child: Stack(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 18, right: 18),
                              height: size.height * .15,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SelectedHomeCategory("غسيل سيارات",
                                      "assets/car_wash.svg", carGradient),
                                  SelectedHomeCategory("غسيل سجاد",
                                      "assets/carbet.svg", carpetGradiant),
                                  SelectedHomeCategory(
                                      "غسيل ملابس",
                                      "assets/clothes_wash.svg",
                                      clothesGradiant),
                                  SelectedHomeCategory("كي ملابس",
                                      "assets/mkwa.svg", ironGradiant),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * .03,
                            ),
                            Wrap(
                              spacing: size.width * .02,
                              direction: Axis.horizontal,
                              runSpacing: size.width * .04,
                              children: <Widget>[
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                                HomeItem(trs.translate("gada-alkhabar"),
                                    "assets/drip_dry.png", "دريب اند دراي"),
                              ],
                            )
                          ],
                        ),
                      ]))),
                )
              ],
            ),
            Positioned(
                top: 20,
                right: 0,
                left: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: IconButton(
                                icon: new Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  mainScaffoldKey.currentState.openDrawer();
                                },
                              )),
                        ],
                      )
                    ])),
            Positioned(
              top: size.height * 0.25,
              child: Container(
                  height: size.height * .08,
                  width: size.width,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Card(
                    elevation: 8,
                    child: ListTile(
                      leading: Icon(Icons.search, size: 23, color: dismiscolor),
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: 'ابحث...',
                            hintStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none),
                        // onChanged: onSearchTextChanged,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.tune, size: 23, color: dismiscolor),
                        onPressed: () {
                          // onSearchTextChanged('');
                        },
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
