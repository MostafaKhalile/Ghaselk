import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaselk/constants/constants.dart';
import 'package:ghaselk/models/slider.dart';
import 'package:ghaselk/screens/auth/login.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/widgets/slide_items/slide_dots.dart';
import 'package:ghaselk/widgets/slide_items/slide_item.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration.zero, (Timer timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      print(index);
    });
  }

  void onAddButtonTapped(int index) {
    // use this to animate to the page
    _pageController.animateToPage(index,
        curve: Curves.easeInOut, duration: Duration(microseconds: 100));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: topSliderLayout(),
        ),
      );

  Widget topSliderLayout() => Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: sliderArrayList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Positioned(
                        bottom: MediaQuery.of(context).size.width * 0.1,
                        right: 10,
                        left: 10,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              onPressed: () {
                                if (_currentPage == 0) {
                                  onAddButtonTapped(1);
                                } else if (_currentPage == 1) {
                                  onAddButtonTapped(2);
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => LoginScreen()));
                                }
                              },
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                Constants.NEXT,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    color: Colors.white),
                              ),
                            ))),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => LoginScreen()));
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    Constants.SKIP,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ))),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.33,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Text(
                          '@ all right ghaselk 2020',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: orderpicker.withOpacity(0.28)),
                        ))
                  ],
                )
              ],
            )),
      );
}
