import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/repos/auth_repo.dart';
import 'package:ghaselk/screens/Client/client_home_page.dart';
import 'package:ghaselk/screens/auth/new_password.dart';
import 'package:ghaselk/screens/auth/sign_up.dart';
import 'package:ghaselk/utils/alert_manager.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/text_feilds/password_input_feild.dart';
import 'package:ghaselk/widgets/text_feilds/phone_input_feild.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../Client/client_profile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void _handelLogin() async {
    final AppTranslations trs = AppTranslations.of(context);
    if (_passwordController.text.length == 0) {
      alertWithErr(msg: trs.translate('enter_password'), context: context);
      return;
    }

    if (_phoneController.text.length < 9) {
      alertWithErr(msg: trs.translate('phone_is_too_short'), context: context);
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });
      // await Provider.of<AuthRepo>(context, listen: false).login(
      //   phoneNo: _phoneController.toString(),
      //   password: _passwordController.toString(),
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ClientHome(),
        ), //todo pushreplacement
      );
    } catch (e) {
      alertWithErr(
          msg: AppTranslations.of(context).translate('Couldnot_auth_you'),
          context: context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleSignUP() async {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
  }

  void _handelForgetPassword() async {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NewPassword()));
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: AssetImage(
                        loginBackground,
                      ),
                      repeat: ImageRepeat.noRepeat),
                  gradient: gradieant,
                )),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.12, width: size.width),
                  Image.asset(
                    logoWhite,
                    width: size.width * 0.22,
                    scale: 0.5,
                  ),
                  Text(
                    trs.translate('login_slogan'),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  PhoneInpitFeild(
                      controller: _phoneController,
                      backgroundColor: inputDarkColor),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  PasswordInputFeild(
                      controller: _passwordController,
                      backgroundColor: inputDarkColor,
                      title: trs.translate('password')),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Container(
                    width: size.width * 0.85,
                    height: size.height * 0.08,
                    child: MaterialButton(
                      height: size.height * 0.1,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: blueMain,
                      onPressed: () {
                      _handelLogin();
                      },
                      child: Text(
                        trs.translate('login'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InkWell(
                    onTap: _handleSignUP,
                    child: Container(
                      child: Text(
                        trs.translate('sign_with_us_now'),
                        style: TextStyle(
                            color: selectedStarColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  InkWell(
                    onTap: _handelForgetPassword,
                    child: Container(
                      child: Text(
                        trs.translate('forget_pin'),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
