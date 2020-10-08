import 'package:flutter/material.dart';
import 'package:ghaselk/models/order_steps.dart';
import 'package:ghaselk/utils/colors.dart';
import 'package:ghaselk/widgets/first_stepper/number_stepper.dart';

class OrdesStepperHeader extends StatefulWidget {
  final String orderId;
  final int index;
  final OrderStep currentStep;
  OrdesStepperHeader({
    @required this.currentStep,
    this.orderId,
    this.index,
  });

  @override
  _OrdesStepperHeaderState createState() => _OrdesStepperHeaderState();
}

class _OrdesStepperHeaderState extends State<OrdesStepperHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    selectedIndex = widget.index;
    return Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 25,
              right: 25,
              child: Text(
                "طلب رقم :${widget.orderId} ",
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 14,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(widget.currentStep.imagePath),
                  Container(
                    width: size.width * 0.70,
                    height: 50,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: NumberStepper(
                        // stepRadius: 48.0,
                        onStepReached: (value) {
                          print(value);
                          selectedIndex = value;
                        },
                        numbers: [1, 2, 3, 4, 5],
                        direction: Axis.horizontal,
                        stepPadding: 5.0,
                        enableNextPreviousButtons: false,
                        activeStepColor: activeStepColor,
                        activeStepBorderColor: orderpicker,
                        stepBorderColor: orderpicker,
                        stepRadius: 15,
                        lineLength: 15,
                        steppingEnabled: true,
                        activeStepBorderWidth: 1,
                        enableStepTapping: true,
                        stepColor: Colors.white,
                        activeStepBorderPadding: 0,
                        lineColor: orderpicker,
                        activeNumberStyle: TextStyle(
                            color: activeStepColor,
                            fontWeight: FontWeight.bold),
                        numberStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    widget.currentStep.stepTitle,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 18,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
