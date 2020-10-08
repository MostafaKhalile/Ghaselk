class OrderStep {
  final String imagePath;
  final String stepTitle;

  OrderStep(
    this.imagePath,
    this.stepTitle,
  );
}

final stepsArrayList = [
  OrderStep(
    "assets/request_location.png",
    "تحديد العنوان",
  ),
  OrderStep(
    "assets/new_requist_makwa.png",
    "نوع الخدمة",
  ),
  OrderStep(
    "assets/tshirt.png",
    "اختيار الخدمه الفرعيه",
  ),
  OrderStep(
    "assets/requist_time_receving.png",
    "موعد التسليم",
  ),
  OrderStep(
    "assets/requist_time_receving.png",
    "موعد التسليم",
  ),
];

class OredrStep {
  OredrStep(String s, String t);
}
