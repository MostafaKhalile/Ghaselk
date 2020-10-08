import 'package:intl/intl.dart';

class NotificationModel {
  String id;
  String date;
  String time;
  String title;
  String body;
  String readAt;

  NotificationModel(
      {this.id, this.date, this.time, this.readAt, this.title, this.body});
  NotificationModel.fromJson(Map<String, dynamic> json)
      : id = json["data"]["id"].toString(),
        date = json["created_at"],
        time = DateFormat('hh:mm', 'en')
            .format(DateTime.parse(json["created_at"]))
            .toString(),
        title = json["data"]["title"],
        readAt = json["read_at"];

  Map<String, dynamic> toJson() =>
      {"id": id, 'date': date, 'time': date, 'title': title, 'read_at': readAt};
}
