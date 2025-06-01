class NotificationsModel {
  String? title, image, body, date, time;

  NotificationsModel({this.title, this.image, this.body, this.date, this.time});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    {
      return NotificationsModel(
          title: json["Title"],
          image: json["Image"],
          body: json["Body"],
          date: json["Date"],
          time: json["Time"]);
    }
  }
}
