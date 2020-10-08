import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ghaselk/screens/Client/orders.dart';
import 'package:ghaselk/screens/shared/notification_screen.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/widgets/app_drawer.dart';

import 'delivery_main_page.dart';
import 'driver_profile.dart';

GlobalKey<NavigatorState> deliveryNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> deliverMainScaffoldKey = GlobalKey<ScaffoldState>();

class DeliveryHome extends StatefulWidget {
  @override
  _DeliveryHomeState createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  int _currentIndex = 3;
  bool hasStartedOrder = false;

//dynamically changes page title for every index..
  String pageTitle() {
    if (_currentIndex == 0) {
      return '';
    } else if (_currentIndex == 1) {
      return 'التنبيهات';
    } else if (_currentIndex == 2) {
      return 'الطلبات';
    } else if (_currentIndex == 3) {
      return 'طلبات اليوم';
    }
    return '';
  }

  //list for bottom navigator tabs
  final List<Widget> _children = [
    DriverProfile(),
    NotificationScreen(),
    OrdersScreen(),
    DeliveryMainPage()
  ];
  // function that changes the active tab index on tap one .
  void onTabTapped(int index) {
    deliveryNavigatorKey.currentState.maybePop();
    setState(() {
      _currentIndex = index;
    });
  }

// afunction that return bottom navigator bar
  Widget _myBottomNavigatorBar() {
    return Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: blueIconColor,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white),
              subtitle1: TextStyle(
                  fontSize:
                      10))), // sets the inactive color of the `BottomNavigationBar`
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a  tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/account.svg",
              height: 22,
              color: _currentIndex == 0 ? blueIconColor : inactiveTab,
            ),
            title: Text(
              "الملف الشخصي",
              style: TextStyle(
                  fontSize: 12,
                  color: _currentIndex == 0 ? blueIconColor : inactiveTab),
            ),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/notifications.svg",
                  height: 22,
                  color: _currentIndex == 1 ? blueIconColor : inactiveTab,
                ),
                // Positioned(
                //   right: 0,
                //   child: Container(
                //     padding: EdgeInsets.all(1),
                //     decoration: BoxDecoration(
                //       color: Colors.red,
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     constraints: BoxConstraints(
                //       minWidth: 15,
                //       minHeight: 15,
                //     ),
                //     child: StreamBuilder(
                //         initialData: 0,
                //         stream: countStream.notificationsCountStream,
                //         builder: (_, snapshot) => Text(
                //               "${snapshot.data}",
                //               style: TextStyle(
                //                 fontFamily: 'Roboto',
                //                 color: Colors.white,
                //                 fontSize: 12,
                //               ),
                //               textAlign: TextAlign.center,
                //             )),
                //   ),
                // )
              ],
            ),
            title: Text(
              "الإشعارات",
              style: TextStyle(
                  color: _currentIndex == 1 ? blueIconColor : inactiveTab),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/orders.svg",
              height: 22,
              color: _currentIndex == 2 ? blueIconColor : inactiveTab,
            ),
            title: Text(
              "الطلبات",
              style: TextStyle(
                  color: _currentIndex == 2 ? blueIconColor : inactiveTab),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/mainPage.svg",
              height: 22,
              color: _currentIndex == 3 ? blueIconColor : inactiveTab,
            ),
            title: Text(
              "الصفحة الرئيسية",
              style: TextStyle(
                  fontSize: 12,
                  color: _currentIndex == 3 ? blueIconColor : inactiveTab),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            key: deliverMainScaffoldKey,
            resizeToAvoidBottomPadding: false,
            drawer: AppDrawer(),
            body: CustomNavigator(
              navigatorKey: deliveryNavigatorKey,
              home: Builder(builder: (context) {
                return _children[_currentIndex];
              }),
              pageRoute: PageRoutes.cupertinoPageRoute,
            ),
            bottomNavigationBar: _myBottomNavigatorBar()));
  }
}
