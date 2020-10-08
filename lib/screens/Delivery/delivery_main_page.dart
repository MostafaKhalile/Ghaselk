import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:ghaselk/screens/Delivery/tabs/accepted_orders.dart';
import 'package:ghaselk/screens/Delivery/tabs/avilable_orders.dart';
import 'package:ghaselk/widgets/app_drawer.dart';

import 'delivery_home_page.dart';

class DeliveryMainPage extends StatefulWidget {
  @override
  _DeliveryMainPageState createState() => _DeliveryMainPageState();
}

class _DeliveryMainPageState extends State<DeliveryMainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool isLoading = false;
  Position position;
  String address;
  String locationString;

  List<Tab> tabs = <Tab>[
    Tab(text: " الطلبات الجارية "),
    Tab(text: "   الطلبات  "),
  ];

  LinearGradient gradieant = LinearGradient(
    begin: Alignment(0.43, -1.18),
    end: Alignment(1.2, 4.22),
    colors: [const Color(0xff023a47), const Color(0xff000c0e)],
    stops: [0.0, 1.0],
  );
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: AppDrawer(),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return gradieant.createShader(bounds);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/home_panner.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    )),
                TabBar(
                  // isScrollable: true,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.all(10),
                  tabs: tabs,
                  labelStyle: TextStyle(fontFamily: "GE SS Two",fontWeight: FontWeight.bold,fontSize: 16),
                  controller: _tabController,
                ),
                Expanded(
                  flex: 2,
                  child: TabBarView(controller: _tabController, children: [
                    AcceptedOrders(),
                    AvilableOrders(),
                  ]),
                )
              ],
            ),
            Positioned(
                top: 20,
                right: 0,
                left: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: IconButton(
                                icon: new Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  deliverMainScaffoldKey.currentState
                                      .openDrawer();
                                },
                              )),
                        ],
                      )
                    ])),
            // Positioned(
            //   top: size.height * 0.25,
            //   child: Container(
            //       height: size.height * .08,
            //       width: size.width,
            //       padding: EdgeInsets.only(left: 18, right: 18),
            //       child: Card(
            //         elevation: 8,
            //         child: ListTile(
            //           leading: Icon(Icons.search, size: 23, color: dismiscolor),
            //           title: TextField(
            //             decoration: InputDecoration(
            //                 hintText: 'ابحث...',
            //                 hintStyle: TextStyle(fontSize: 20),
            //                 border: InputBorder.none),
            //             // onChanged: onSearchTextChanged,
            //           ),
            //           trailing: IconButton(
            //             icon: Icon(Icons.tune, size: 23, color: dismiscolor),
            //             onPressed: () {
            //               // onSearchTextChanged('');
            //             },
            //           ),
            //         ),
            //       )),
            // ),
          ],
        ));
  }
}
