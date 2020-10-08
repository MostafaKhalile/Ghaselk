import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ghaselk/screens/Delivery/delivery_home_page.dart';
import 'package:ghaselk/utils/alert_manager.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/enums.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/image_picker_widget.dart';
import 'package:ghaselk/widgets/sgin_up_bottom.dart';
import 'package:ghaselk/widgets/text_feilds/text_input_feild.dart';
import 'package:image_picker/image_picker.dart';

class SignUpAsDriver extends StatefulWidget {
  @override
  _SignUpAsDriverState createState() => _SignUpAsDriverState();
}

class _SignUpAsDriverState extends State<SignUpAsDriver> {
  var _isloading = false;
  Gender _selectedgender = Gender.male;
  File _storedpresonalimg;
  File _storednatidimg;
  File _storedformimg;
  File _storedlicenceimg;
  File _storedfrontimg;
  File _storedbackimg;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  // PickedFile photo  x 6

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
    // if (_passwordController.text.length == 0) {
    //   alertWithErr(msg: trs.translate('enter_password'), context: context);
    //   return;
    // }
    // if (_rePasswordController.text.length == 0) {
    //   alertWithErr(
    //       msg: trs.translate('enter_confirm_password'), context: context);
    //   return;
    // }
    // if (_passwordController.text != _rePasswordController.text) {
    //   alertWithErr(
    //       msg: trs.translate('password_did_not_match'), context: context);
    //   return;
    // }
    // if (_passwordController.text.length < 8) {
    //   alertWithErr(
    //       msg: trs.translate('password_is_to_short'), context: context);
    //   return;
    // }
    // if (_phoneController.text.length < 9) {
    //   alertWithErr(msg: trs.translate('phone_is_too_short'), context: context);
    //   return;
    // }
    // if (!isChecked) {
    //   alertWithErr(
    //       msg: trs.translate('must_agree_terms_of_use'), context: context);
    //   return;
    // }
    // if (_storedpresonalimg == null) {
    //   alertWithErr(msg: "أضف صورة شخصية", context: context);
    //   return;
    // }
    // if (_storednatidimg == null) {
    //   alertWithErr(msg: "أضف صورة الهوية الوطنية", context: context);
    //   return;
    // }
    // if (_storedformimg == null) {
    //   alertWithErr(msg: "أضف صورة الاستمارة", context: context);
    //   return;
    // }
    // if (_storedlicenceimg == null) {
    //   alertWithErr(msg: "أضف صورة رخصة القيادة", context: context);
    //   return;
    // }

    // if (_storedfrontimg == null) {
    //   alertWithErr(msg: "أضف صورة المركبة من الأمام", context: context);
    //   return;
    // }
    // if (_storedbackimg == null) {
    //   alertWithErr(msg: "أضف صورة المركبة من الخلف", context: context);
    //   return;
    // }
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

  Future _getImage(ImageSource source, Photos photo) async {
    File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: source,
    );

    setState(() {
      _image = File(pickedFile.path);
      switch (photo) {
        case Photos.perosnal:
          _storedpresonalimg = _image;
          break;
        case Photos.id:
          _storednatidimg = File(pickedFile.path);
          break;
        case Photos.form:
          _storedformimg = _image;
          break;
        case Photos.driverLicncse:
          _storedlicenceimg = File(pickedFile.path);
          break;
        case Photos.carFront:
          _storedfrontimg = File(pickedFile.path);
          break;
        case Photos.carBack:
          _storedbackimg = File(pickedFile.path);
          ;
          break;
      }
    });
    _image != null ? print(true) : print(false);
    _storedformimg != null ? print("1") : print("2");
    Navigator.pop(context);
  }

  void _openImagePicker(BuildContext context, Photos photo) {
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
                  _getImage(ImageSource.camera, photo);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('الاستوديو'),
                onPressed: () {
                  _getImage(ImageSource.gallery, photo);
                },
              )
            ]),
          );
        });
  }

//  void pickImage(Photos photo) async {
//    switch (photo) {
//      case Photos.perosnal:_openImagePicker(context);
//        break;
//      case Photos.id:
//        break;
//      case Photos.form:
//        break;
//      case Photos.driverLicncse:
//        break;
//      case Photos.carFront:
//        break;
//      case Photos.carBack:
//        break;
//    }
//  }

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
              height: size.height * .02,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  Text(
                    "معلومات شخصية",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
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
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: size.width * 0.33,
                            height: 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedgender == Gender.male
                                      ? Colors.white
                                      : const Color(0x29000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 17,
                                ),
                              ],
                            ),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              color: _selectedgender == Gender.male
                                  ? Color(0xff0da8cd)
                                  : Colors.white,
                              child: Text(
                                trs.translate('male'),
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: _selectedgender == Gender.male
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedgender = Gender.male;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: size.width * 0.33,
                            height: 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedgender == Gender.female
                                      ? Colors.white
                                      : const Color(0x29000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 17,
                                ),
                              ],
                            ),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              color: _selectedgender == Gender.female
                                  ? Color(0xff0da8cd)
                                  : Colors.white,
                              child: Text(
                                trs.translate('female'),
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: _selectedgender == Gender.female
                                        ? Colors.white
                                        : Colors.black),
                              ), //`Text` to display
                              onPressed: () {
                                setState(() {
                                  _selectedgender = Gender.female;
                                });
                              },
                            ),
                          ),
                        ]),
                  )),
            ),
            ImagePickerWidget(
              hint: trs.translate('minimum_pic_size'),
              onImageChanged: (PickedFile file) {
                _openImagePicker(context, Photos.perosnal);
                setState(() {});
              },
              title: trs.translate('profile_pic'),
            ),
            ImagePickerWidget(
              hint: trs.translate('id_pic_hint'),
              onImageChanged: (PickedFile file) {
                _openImagePicker(context, Photos.id);
              },
              title: trs.translate('id_pic'),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  color: Colors.blue,
                ),
                Text(trs.translate('car_data_section'))
              ],
            ),
            ImagePickerWidget(
              hint: trs.translate('paper_pic_hint'),
              onImageChanged: (PickedFile file) {
                _openImagePicker(context, Photos.form);
              },
              title: trs.translate('paper_pic'),
            ),
            ImagePickerWidget(
              hint: trs.translate('driver_id_pic_hint'),
              onImageChanged: (PickedFile file) {
                _openImagePicker(context, Photos.driverLicncse);
              },
              title: trs.translate('driver_id_pic'),
            ),
            Center(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _openImagePicker(context, Photos.carFront);
                        },
                        child: Image.asset(carFront),
                      ),
                      Text(trs.translate('front_pic'))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _openImagePicker(context, Photos.carBack);
                        },
                        child: Image.asset(carBack),
                      ),
                      Text(trs.translate('back_pic'))
                    ],
                  )
                ],
              )),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SignUpBottom(
              isloading: _isloading,
              onClicked: (bool isChecked) {
                signUP(isChecked);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => DeliveryHome(),
                //   ), //todo pushreplacement
                // );
              },
            ),
            SizedBox(
              height: size.height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
