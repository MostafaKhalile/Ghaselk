import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numpad_widget/flutter_numpad_widget.dart';
import 'package:ghaselk/screens/auth/E_new_password.dart';
import 'package:ghaselk/screens/auth/new_password.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/gradeints.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/gradient_button.dart';
// import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class Sendcode extends StatefulWidget {
  @override
  _SendcodeState createState() => _SendcodeState();
}

class _SendcodeState extends State<Sendcode> {
  NumpadController _numpadController = NumpadController();
  void initState() {
    _numpadController = NumpadController(
        format: NumpadFormat.PIN4, onInputValidChange: (bool valid) {});
    this._numpadController.addListener(_controllerListener);
    super.initState();
  }

  void _controllerListener() {
    //Do things with the data in the controller.
    if (_numpadController.inputValid && _numpadController.inputValid != null) {
      // verify(widget.phone, _numpadController.rawNumber.toString());
    }
    print("verify code is: ${_numpadController.inputValid}");
  }

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
                      SizedBox(height: size.height * .15),
                      RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                            text: trs.translate("awaiting_code") +
                                "\n 123467890 ",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                  text: trs.translate(
                                    "change_phone_no",
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  NewPassword()));
                                    })
                            ]),
                      ),
                    ],
                  ),
                )
              ]),
              Center(
                  child: Container(
                      height: size.height * .6,
                      width: size.width * .8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: NumpadText(
                              style:
                                  TextStyle(fontSize: 40, color: Colors.black),
                              animateError: true,
                              errorColor: Colors.redAccent,
                              controller: _numpadController,
                            ),
                          ),
                          GradientButton(
                            height: size.height * .06,
                            width: double.infinity,
                            gradStart: darkGradientBlue,
                            gradEnd: lightGradientBlue,
                            radius: 0,
                            child: new Text(
                              trs.translate("send_code"),
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
                                      builder: (ctx) => ENewPassword()));
                            },
                          ),
                          SizedBox(height: 15,),
                          Positioned(
                              bottom: 10,
                              child: Theme(
                                  data: ThemeData(fontFamily: 'Arial'),
                                  child: Numpad(
                                    controller: _numpadController,
                                    buttonColor: Colors.white,
                                    height: size.height * 0.3,
                                    innerPadding: 0.5,
                                    textColor: Colors.black54,
                                    buttonTextSize: 40,
                                  ))),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
