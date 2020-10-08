import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/enums.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/order_card.dart';
import 'package:ghaselk/widgets/orders_type_picker.dart';
import 'client_home_page.dart';
import 'order_details.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

orderstype _currentType = orderstype.waiting;

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final Size size = MediaQuery.of(context).size;
    Widget slectedTypeFeilds;
    switch (_currentType) {
      case orderstype.waiting:
        slectedTypeFeilds = Wrap(
          spacing: 5,
          children: <Widget>[
            OrderCard('12 مارس 2020', "قيد الإنتظار", "assets/drip_dry.png",
                "دريب اند دراي", trs.translate("gada-alkhabar"), "غسيل+كى", () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => OrderDetailsPage()));
            })
          ],
        );

        break;
      case orderstype.workingon:
        slectedTypeFeilds = Wrap(
          spacing: 10,
          children: <Widget>[
            OrderCard('12 مارس 2020', "قيد التنفيذ", "assets/drip_dry.png",
                "دريب اند دراي", trs.translate("gada-alkhabar"), "غسيل+كى", () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => OrderDetailsPage()));
            })
          ],
        );
        break;
      case orderstype.done:
        slectedTypeFeilds = Wrap(
          spacing: 10,
          children: <Widget>[
            OrderCard('12 مارس 2020', "تمت", "assets/drip_dry.png",
                "دريب اند دراي", trs.translate("gada-alkhabar"), "غسيل+كى",() {
         Navigator
              .push(context,CupertinoPageRoute(builder: (_) => OrderDetailsPage()));
        }),
          ],
        );

        break;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlue,
        title: Text(
          trs.translate("orders"),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => mainScaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Orders_type_picker(
                onorderTypeChanged: (orderstype type) {
                  setState(() {
                    _currentType = type;
                  });
                },
              ),
              SizedBox(
                height: size.height * .03,
              ),
              slectedTypeFeilds
            ],
          ),
        ),
      ),
    );
  }
}
