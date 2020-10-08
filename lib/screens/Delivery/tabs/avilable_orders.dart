import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ghaselk/screens/Client/client_home_page.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/enums.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/app_drawer.dart';
import 'package:ghaselk/widgets/order_card.dart';
import 'package:ghaselk/widgets/orders_type_picker.dart';

import '../driver_details_offer.dart';

class AvilableOrders extends StatefulWidget {
  @override
  _AvilableOrdersState createState() => _AvilableOrdersState();
}

class _AvilableOrdersState extends State<AvilableOrders> {
  orderstype _currentType = orderstype.workingon;
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Center(
                      child: OrderCard(
                    '12 مارس 2020',
                    "قيد الإنتظار",
                    "assets/drip_dry.png",
                    "دريب اند دراي",
                    trs.translate("gada-alkhabar"),
                    "غسيل+كى",
                    () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => DriverDetailsOffer()));
                    },
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
