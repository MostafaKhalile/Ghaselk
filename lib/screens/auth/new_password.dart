import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/screens/auth/send_code.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/gradeints.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/gradient_button.dart';

class NewPassword extends StatelessWidget {
  static const routeName = '/New_password';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppTranslations trs = AppTranslations.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: darkBlue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                ShaderMask(
                    blendMode: BlendMode.multiply,
                    shaderCallback: (Rect bounds) =>
                        kHomeScrrenTypeGradient.createShader(bounds),
                    child: Container(
                      height: size.height * .27,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(loginBackground),
                              fit: BoxFit.cover)),
                    )),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * .17),
                      Text(
                        trs.translate("forget_pin"),
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 18,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(
                height: size.height * .05,
              ),
              Center(
                  child: Container(
                      height: size.height * .5,
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone_android,
                                color: Colors.blue,
                                size: 18,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "رقم الجوال",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          Container(
                            height: size.height * .06,
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 10, 10, 10),
                                hintText: '56123456',
                                hintStyle: TextStyle(fontSize: 15),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          GradientButton(
                            height: size.height * .06,
                            width: double.infinity,
                            gradStart: darkGradientBlue,
                            gradEnd: lightGradientBlue,
                            radius: 0,
                            child: new Text(
                              'ارسال كود التفعيل ',
                              style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            onButtonTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Sendcode()));
                            },
                          ),
                        ],
                      ))),
              Text(
                'Ghaselk @ 2020 v.1',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 13,
                  color: const Color(0x47707070),
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ));
  }
}
