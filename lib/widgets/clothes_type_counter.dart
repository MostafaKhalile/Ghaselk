import 'package:flutter/material.dart';

class clothes_type_counter extends StatefulWidget {
  final  String type;
  clothes_type_counter(this.type);
  @override
  _clothes_type_counterState createState() => _clothes_type_counterState();
}
int type_count=0;
class _clothes_type_counterState extends State<clothes_type_counter> {

  @override
  Widget build(BuildContext context) {final size = MediaQuery.of(context).size;
    return
        Container( padding: EdgeInsets.only(
            left: size.width * .1, right: size.width * .1),
          width: size.width,
          height: size.height * .09,
          decoration: BoxDecoration(
            color: const Color(0xffF5FDFF),
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
               widget.type ,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 14,
                  color: const Color(0xff023a47),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon:Icon( Icons.add), onPressed: (){
                    setState(() {
                      type_count = type_count+1;
                    });
                  }),
                  Text(
                   type_count>=0? type_count.toString():"0",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: const Color(0xff023a47),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  IconButton(icon:Icon( Icons.minimize) ,
                      alignment: Alignment.topCenter, onPressed: (){
                        setState(() {
                          type_count = type_count-1;
                        });
                      })
                ],
              )
            ],

    ),
        );
  }
}



