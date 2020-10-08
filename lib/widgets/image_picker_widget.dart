import 'package:flutter/material.dart';
import 'package:ghaselk/utils/images.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final String title;
  final String hint;
  final Function onImageChanged;

  ImagePickerWidget({this.hint, this.onImageChanged, this.title});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  PickedFile file;
                  widget.onImageChanged(file);
                },
                child: Image.asset(
                  addImage,
                  width: size.width * 0.10,
                  height: size.width * 0.10,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Text(
                widget.hint,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
