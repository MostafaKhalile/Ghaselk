import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghaselk/screens/Delivery/delivery_home_page.dart';
import 'package:ghaselk/utils/alert_manager.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/image_picker_widget.dart';
import 'package:ghaselk/widgets/sgin_up_bottom.dart';
import 'package:ghaselk/widgets/text_feilds/text_input_feild.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:image_picker/image_picker.dart';

class SignUpAsProvider extends StatefulWidget {
  @override
  _SignUpAsProviderState createState() => _SignUpAsProviderState();
}

class _SignUpAsProviderState extends State<SignUpAsProvider> {
  bool _isloading = false;
  File _storedpresonalimg;
  List<String> choises = List();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  // PickedFile _photo;
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
    if (_storedpresonalimg == null) {
      alertWithErr(msg: "أضف لوجو المكان", context: context);
      return;
    }
    if (choises.length == 0) {
      alertWithErr(msg: "من فضلك اختر الخدمات المقدمة ", context: context);
      return;
    }

    try {
      setState(() {
        _isloading = true;
      });
      // await Provider.of<AuthRepo>(context, listen: false).signUpDriver(
      //   name: _nameController.toString(),
      //   address: _addressController.toString(),
      //   email: _emailController.toString(),
      //   password: _passwordController.toString(),
      //   passwordConfirm: _rePasswordController.toString(),
      //   phoneNo: _phoneController.toString(),
      //   gender: _selectedgender == Gender.male ? "male" : "female",
      //   profilePic: _storedpresonalimg,
      //   carBackPic: _storedbackimg,
      //   driverLicnsePic: _storedlicenceimg,
      //   carFrontPic: _storedfrontimg,
      //   nationalIdPic: _storednatidimg,
      //   contractPic: _storedformimg,
      // );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => DeliveryHome(),
          ),
          ModalRoute.withName('/'));
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

  void _openImagePicker(BuildContext context) {
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

  Future _getImage(ImageSource source) async {
    File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: source,
    );

    setState(() {
      _image = File(pickedFile.path);
      _storedpresonalimg=_image;
    });
    _image != null ? print(true) : print(false);
    Navigator.pop(context);
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputTextFeild(
              controller: _nameController,
              hintText: trs.translate('full_name'),
              icon: Icons.person,
              title: trs.translate('name'),
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
            ImagePickerWidget(
              hint: trs.translate('add_photo_hint'),
              onImageChanged: (PickedFile file) {
                _openImagePicker(context);
                setState(() {});
              },
              title: trs.translate('add_photo'),
            ),
            InputTextFeild(
              controller: _addressController,
              hintText: trs.translate('enter_address'),
              icon: Icons.location_on,
              title: trs.translate('addres'),
              prefixIcon: Icons.location_on,
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
            Container(
              height: MediaQuery.of(context).size.height * .255,
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(trs.translate('servicess')),
                  CheckboxGroup(
                    labels: <String>[
                      trs.translate('mkwa_ghasel'),
                      trs.translate('carpet'),
                      trs.translate('washing'),
                    ],
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> checked) {
                      setState(() {
                        choises = checked;
                      });
                    },
                  ),
                ],
              ),
            ),
            SignUpBottom(
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
