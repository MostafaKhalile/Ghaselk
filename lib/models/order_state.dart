class OrderState {
  final String imagePath;
  final String iconPath;
  final String title;
  final String subTitle;

  OrderState({
    this.iconPath,
    this.subTitle,
    this.imagePath,
    this.title,
  });
}

final statesArrayList = [
  OrderState(
      iconPath: "assets/home.svg",
      subTitle: "في الطريق اليك",
      title: "مندوبنا في الطريق اليك",
      imagePath: "assets/ongoing.svg"),
  OrderState(
      iconPath: "assets/van.svg",
      subTitle: "في الطريق الينا",
      title: "طلبك قيد الوصول",
      imagePath: "assets/ondeliver.svg"),
  OrderState(
      iconPath: "assets/washer.svg",
      subTitle: "تم البدء",
      title: "تم استلام الطلب ",
      imagePath: "assets/delivered.svg"),
  OrderState(
      iconPath: "assets/doneIcon.svg",
      subTitle: "انتهى الطلب",
      title: "تم الانتهاء من الطلب ترقب وصوله اليك",
      imagePath: "assets/done.svg"),
];
