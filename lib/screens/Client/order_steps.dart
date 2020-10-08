import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ghaselk/models/order_steps.dart';
import 'package:ghaselk/models/services.dart';
import 'package:ghaselk/screens/requist_details.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/utils/enums.dart';
import 'package:ghaselk/utils/locales/app_translations.dart';
import 'package:ghaselk/widgets/app_drawer.dart';
import 'package:ghaselk/widgets/click_button.dart';
import 'package:ghaselk/widgets/clothes_type_counter.dart';
import 'package:ghaselk/widgets/first_stepper/base_stepper.dart';
import 'package:ghaselk/widgets/requist_header_widget.dart';
import 'package:ghaselk/widgets/requist_Time_location_widget.dart';
import 'package:ghaselk/widgets/selected_order_type_widget.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class OrderStepper extends StatefulWidget {
  @override
  _OrderStepperState createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  List<int> data = [];
  int _focusedIndex = 0;

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }

  void _handlelocation(BuildContext context) async {
    var counter = context.read<Counter>();
    counter.decrement();
  }

  void _handlenavigation(BuildContext context) async {
    var counter = context.read<Counter>();
    counter.increment();
  }

  void _handleaddnotes() async {}

  void _handleaddanotherservice(BuildContext context) async {
    Navigator.pop(context);
  }

  void _handeleditlocation() async {}
  void _handeledittime() async {}
  void _handledetailsscreennavigation(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => RequistDetails()));
  }

  Future<bool> _onWillPop() async {
    if (currentStep > 0) {
      var counter = context.read<Counter>();
      counter.decrement();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    var counter = context.read<Counter>();
    counter.reset();
      super.dispose();
  }

  int currentStep = 0;
  @override
  void initState() {
    super.initState();

    var counter = context.read<Counter>();
    currentStep = counter.value;
    counter.addListener(_listener);
  }

  void _listener() {
    var counter = context.read<Counter>();
    setState(() {
      currentStep = counter.value;
    });
  }

  final LinearGradient ghaseelgradiant = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.97),
    colors: [const Color(0x5e4a4385), const Color(0x5e000001)],
    stops: [0.0, 1.0],
  );
  final LinearGradient ghaseelkai = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.97),
    colors: [const Color(0x544a4385), const Color(0x54000001)],
    stops: [0.0, 1.0],
  );

  ordercategory _currentType = ordercategory.ghaseelkai;
  @override
  Widget build(BuildContext context) {
    final AppTranslations trs = AppTranslations.of(context);
    final size = MediaQuery.of(context).size;
    return
        //  WillPopScope(
        //     onWillPop: _onWillPop,
        //     child:
        Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
                backgroundColor: darkBlue,
                centerTitle: true,
                title: Text(
                  trs.translate("new_order"),
                  style: TextStyle(
                    fontFamily: 'GE SS Two',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w300,
                  ),
                )),
            drawer: AppDrawer(),
            body: Column(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: OrdesStepperHeader(
                      currentStep: stepsArrayList[currentStep],
                      index: currentStep,
                      orderId: "1365",
                    )),
                currentStep == 0
                    ? Container(
                        height: size.height * .07,
                        decoration: BoxDecoration(
                          color: const Color(0x1f01262e),
                          border: Border.all(
                              width: 1.0, color: const Color(0x1f707070)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: size.width * .08),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: blueIconColor,
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Text(
                                  'تفاصيل العنوان',
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 14,
                                    color: const Color(0xff023a47),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : currentStep == 2
                        ? Container(
                            height: size.height * .07,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: const Color(0x1f01262e),
                              border: Border.all(
                                  width: 1.0, color: const Color(0x1f707070)),
                            ),
                            padding: EdgeInsets.only(
                                left: size.width * .18, right: size.width * .1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'النوع',
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 14,
                                    color: const Color(0xff023a47),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'الكمية',
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 14,
                                    color: const Color(0xff023a47),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                Expanded(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 15),
                        child: SingleChildScrollView(child: stepperBody(size))))
              ],
            ));
  }

  Widget stepperBody(Size size) {
    int step = currentStep;
    final AppTranslations trs = AppTranslations.of(context);

    var view;
    switch (step) {
      case 0:
        {
          view = Column(
            children: <Widget>[
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width * .9,
                      child: TextField(
                        style: TextStyle(color: Colors.black26),
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                          hintText: 'ادخل عنوان الاستلام والتسليم',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    ClickedButton(Color(0xff06738D), "استخدام العنوان الاساسي",
                        size.width * .75, size.height * .07, _handlelocation),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    ClickedButton(Color(0xff023A47), "التالي",
                        size.width * .75, size.height * .07, _handlenavigation),
                  ],
                ),
              ),
            ],
          );
        }
        break;

      case 1:
        {
          view = Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height * .27,
                    decoration: BoxDecoration(
                      color: const Color(0x91f5fdff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x2f000000),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Container(
                      color: Color(0xFFF5FDFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ScrollSnapList(
                              onItemFocus: _onItemFocus,
                              itemSize: 150,
                              itemBuilder: _buildListItem,
                              itemCount: servicesArrayList.length,
                              dynamicItemSize: true,
                              initialIndex: 1,
                              // dynamicSizeEquation: customEquation, //optional
                            ),
                          ),
                          // _buildItemDetail(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CheckboxGroup(
                labels: <String>[
                  trs.translate("normal_order"),
                  trs.translate("fast_order"),
                ],
                onChange: (bool isChecked, String label, int index) => print(
                    "isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List selected) => setState(() {
                  if (selected.length > 1) {
                    selected.removeAt(0);
                    print('selected length  ${selected.length}');
                  } else {
                    print("only one");
                  }
                }),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              ClickedButton(Color(0xff023A47), "التالي", size.width * .85,
                  size.height * .07, _handlenavigation),
            ],
          );
        }
        break;
      case 2:
        {
          view = Column(children: [
            clothes_type_counter("قميص"),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff707070),
            ),
            clothes_type_counter("تي شيرت"),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff707070),
            ),
            clothes_type_counter("بنطلون"),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff707070),
            ),
            clothes_type_counter("بدلة"),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff707070),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Container(
                padding: EdgeInsets.only(right: size.width * .55),
                child: ClickedButton(Color(0xff06738D), "اضافه ملاحظة",
                    size.width * .4, size.height * .07, _handleaddnotes)),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ClickedButton(Color(0xff023A47), "التالي", size.width * .45,
                    size.height * .07, _handlenavigation),
                ClickedButton(
                    Color(0xffDF6935),
                    "اضافه خدمة اخري",
                    size.width * .45,
                    size.height * .07,
                    _handleaddanotherservice),
              ],
            )
          ]);
        }
        break;
      case 3:
        {
          view = Column(
            children: [
              RequistTimeLocation(
                trs.translate("adders_details"),
                InkWell(
                  onTap: _handeleditlocation,
                  child: Container(
                    child: Text(
                      trs.translate("edit_addres"),
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 14,
                        color: lableColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * .09,
                child: Center(
                  child: Text(
                    'حائل، البغدادية الغربية، جدة 22234، المملكة العربية السعودية',
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 16,
                      color: const Color(0xffc1c1c1),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              RequistTimeLocation(
                trs.translate("drop_time"),
                InkWell(
                  onTap: _handeledittime,
                  child: Container(
                    child: Text(
                      trs.translate("edit_addres"),
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 14,
                        color: lableColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * .1, right: size.width * .1),
                height: size.height * .09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '12  شوال',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: const Color(0xff404040),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '5:00 pm',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: const Color(0xff404040),
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    ClickedButton(
                        Color(0xff023A47),
                        "استمرار",
                        size.width * .75,
                        size.height * .07,
                        _handledetailsscreennavigation),
                  ],
                ),
              ),
            ],
          );
        }
        break;
        //  case constant_expr2: {
        //     //statements;
        //  }
        break;

      default:
        {}
        break;
    }
    return view;
  }

  Widget _buildItemDetail() {
    if (_focusedIndex < 0)
      return Container(
        height: 250,
        child: Text("Nothing selected"),
      );

    if (data.length > _focusedIndex)
      return Container(
        height: 250,
        child: Text("index $_focusedIndex: ${data[_focusedIndex]}"),
      );

    return Container(
      height: 250,
      child: Text("No Data"),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    //horizontal
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SelectedOrderType(
            fontSize: 15,
            imagePath: servicesArrayList[index].imagePath,
            hight: 150,
            width: 150,
            imageHight: 70,
            imageWidth: 70,
            title: servicesArrayList[index].serviceTitle,
            gradientType: servicesArrayList[index].gradient,
          ),
        ],
      ),
    );
  }
}
