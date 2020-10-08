import 'package:flutter/material.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';

class SignUpBottom extends StatefulWidget {
  final Function onClicked;
  bool isloading;

  SignUpBottom({this.onClicked,this.isloading});
  @override
  _SignUpBottomState createState() => _SignUpBottomState();
}

class _SignUpBottomState extends State<SignUpBottom> {
  bool _checked = false;


  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: _checked,

                    onChanged: (bool v) {
                      setState(() {
                        _checked = v;
                      });
                    }),
                Expanded(
                  child: Text(
                    trs.translate('terms_of_servicse'),style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            widget.isloading==true?CircularProgressIndicator():
            MaterialButton(
              height: 40.0,
              minWidth: double.infinity,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(trs.translate('login_full')),
              onPressed: () {
                widget.onClicked(_checked);
              },
            )
          ],
        ),
      ),
    );
  }
}
