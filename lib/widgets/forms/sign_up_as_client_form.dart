import 'package:flutter/material.dart';
import 'package:ghaselk/repos/auth_repo.dart';
import 'package:ghaselk/screens/Client/client_home_page.dart';
import 'package:ghaselk/utils/alert_manager.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/text_feilds/text_input_feild.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../sgin_up_bottom.dart';

class SignUpAsClient extends StatefulWidget {
  @override
  _SignUpAsClientState createState() => _SignUpAsClientState();
}

class _SignUpAsClientState extends State<SignUpAsClient> {
  File _storedpersonal;
  var _isloading = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void signUP(bool isChecked) async {
    final AppTranslations trs = AppTranslations.of(context);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);
    if (!emailValid) {
      alertWithErr(msg: trs.translate('email_not_valid'), context: context);
      return;
    }

    if (_passwordController.text.length == 0) {
      alertWithErr(msg: trs.translate('enter_password'), context: context);
      return;
    }
    if (_rePasswordController.text.length == 0) {
      alertWithErr(
          msg: trs.translate('enter_confirm_password'), context: context);
      return;
    }
    if (_passwordController.text != _rePasswordController.text) {
      alertWithErr(
          msg: trs.translate('password_did_not_match'), context: context);
      return;
    }
    if (_passwordController.text.length < 8) {
      alertWithErr(
          msg: trs.translate('password_is_to_short'), context: context);
      return;
    }
    if (_phoneController.text.length < 9) {
      alertWithErr(msg: trs.translate('phone_is_too_short'), context: context);
      return;
    }
    if (!isChecked) {
      alertWithErr(
          msg: trs.translate('must_agree_terms_of_use'), context: context);
      return;
    }

    try {
      setState(() {
        _isloading = true;
      });
      // await Provider.of<AuthRepo>(context, listen: false).signUpClient(
      //     name: _nameController.toString(),
      //     address: _addressController.toString(),
      //     email: _emailController.toString(),
      //     password: _passwordController.toString(),
      //     passwordConfirm: _rePasswordController.toString(),
      //     phoneNo: _phoneController.toString(),
      //     image: _storedpersonal);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ClientHome(),
        ), //todo pushreplacement
      );
    } catch (e) {
      alertWithErr(
          msg: AppTranslations.of(context).translate('Couldnot_auth_you'),
          context: context);
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  Future _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        _storedpersonal = File(pickedFile.path);
      });
    }
    Navigator.pop(context);
  }

  void _openImagePicker(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * .25,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                'حدد مصدر الصورة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('الكاميرا'),
                onPressed: () {
                  _getImage(ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('الاستوديو'),
                onPressed: () {
                  _getImage(ImageSource.gallery);
                },
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.08,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .03,
            ),
            InkWell(
              onTap: () => _openImagePicker(context),
              child: Center(
                  child: _storedpersonal == null
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: AssetImage(
                                "assets/logo_dark.png",
                              ))),
                          height: size.height * .11,
                          width: size.height * .11,
                        )
                      : CircleAvatar(
                          radius: size.height * .06,
                          backgroundImage:
                              ExactAssetImage(_storedpersonal.path),
                        )),
            ),
            Text(
              trs.translate("add_photo"),
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              textAlign: TextAlign.start,
            ),
            InputTextFeild(
              controller: _nameController,
              hintText: trs.translate('full_name'),
              icon: Icons.person,
              title: trs.translate('name'),
            ),
            InputTextFeild(
              controller: _emailController,
              hintText: 'ahmed@gmail.com',
              icon: Icons.alternate_email,
              title: trs.translate('email'),
            ),
            InputTextFeild(
              controller: _phoneController,
              hintText: '123456789',
              icon: Icons.person,
              inputType: TextInputType.phone,
              isPhone: true,
              title: trs.translate('phone_no'),
              child: Container(
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    '+966  |',
                    style: const TextStyle(
                      color: unSelectedStarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
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
            InputTextFeild(
              controller: _addressController,
              hintText: trs.translate('enter_address'),
              icon: Icons.location_on,
              title: trs.translate('main_addres'),
              prefixIcon: Icons.location_on,
            ),
            SizedBox(
              height: 15,
            ),
            SignUpBottom(
              isloading: _isloading,
              onClicked: (bool isChecked) {
                signUP(isChecked);
              },
            )
          ],
        ),
      ),
    );
  }
}
