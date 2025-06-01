class LatestNewsModel {
  String? name,image,body,url,date,time;


  LatestNewsModel(
      {this.name,
        this.image,
        this.body,
        this.url,
        this.date,
        this.time
      });


  factory LatestNewsModel.fromJson(Map<String, dynamic> json) {
    {

      return LatestNewsModel(

          name: json["Name"],
          image: json["Image"],
          body: json["Body"],
          url: json["URL"],
          date: json["Date"],
          time: json["Time"]

      );
    }
  }
}