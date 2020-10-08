import 'package:flutter/cupertino.dart';

class Service {
  final String imagePath;
  final String serviceTitle;
  final LinearGradient gradient;

  Service(
    this.imagePath,
    this.serviceTitle,
    this.gradient,
  );
}

final servicesArrayList = [
  Service(
      "assets/iron.svg",
      "غسيل + كيي",
      LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.97),
        colors: [const Color(0xFF15746E), const Color(0xFF260524)],
        stops: [0.0, 1.0],
      )),
  Service(
      "assets/clothes_wash.svg",
      "غسيل عادى",
      LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.97),
        colors: [const Color(0xFF74156E), const Color(0xFF260524)],
        stops: [0.0, 1.0],
      )),
  Service(
      "assets/car_wash.svg",
      "غسيل سيارات",
      LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.97),
        colors: [const Color(0xFF4066B1), const Color(0xFF203359)],
        stops: [0.0, 1.0],
      )),
];

class OredrStep {
  OredrStep(String s, String t);
}
