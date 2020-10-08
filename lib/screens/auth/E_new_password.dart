import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/screens/auth/login.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/gradeints.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/gradient_button.dart';
import 'package:ghaselk/widgets/text_feilds/text_input_feild.dart';

class ENewPassword extends StatelessWidget {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * .17),
                      Text(
                        trs.translate("enter_password"),
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
                      height: size.height * .51,
                      width: size.width * .8,
                      child: Column(
                        children: <Widget>[
                          InputTextFeild(
                            controller: _passwordController,
                            hintText: '*********',
                            icon: Icons.lock,
                            title: trs.translate('password'),
                          ),
                          InputTextFeild(
                            controller: _rePasswordController,
                            hintText: '*********',
                            icon: Icons.lock,
                            title: trs.translate('re_password'),
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
                                'ادخال كلمه المرور',
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
                                        builder: (ctx) => LoginScreen()));
                              }),
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
