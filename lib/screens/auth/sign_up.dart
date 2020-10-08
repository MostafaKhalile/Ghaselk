import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/forms/sign_up_as_client_form.dart';
import 'package:ghaselk/widgets/forms/sign_up_as_driver.dart';
import 'package:ghaselk/widgets/forms/sign_up_as_proivder.dart';
import 'package:ghaselk/widgets/user_type_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

enum UserType { client, driver, serviceProvider }

class _SignUpScreenState extends State<SignUpScreen> {
  UserType _currentType = UserType.client;

  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;
    Widget slectedTypeFeilds;
    switch (_currentType) {
      case UserType.client:
        slectedTypeFeilds = SignUpAsClient();
        break;
      case UserType.driver:
        slectedTypeFeilds = SignUpAsDriver();
        break;
      case UserType.serviceProvider:
        slectedTypeFeilds = SignUpAsProvider();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlue,
        title: Text(
          trs.translate('create_account'),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Text(
                  trs.translate('sign_in_as'),
                  style: TextStyle(
                    fontFamily: 'GE SS Two',
                    fontSize: 16,
                    color: const Color(0xff00191e),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              UserTypePicker(
                onUserTypeChanged: (UserType type) {
                  setState(() {
                    _currentType = type;
                  });
                },
              ),
              Container(
                color: babyBlue.withOpacity(0.1),
                child: slectedTypeFeilds,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
