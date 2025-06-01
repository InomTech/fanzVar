class CountryModel {
  String? country;
  double? latitude, longitude;


  CountryModel(
      {this.country,
        this.latitude,
        this.longitude
      });


  factory CountryModel.fromJson(Map<String, dynamic> json) {
    {

      return CountryModel(

          country: json["country"],
          latitude: double.parse(json["latitude"].toString()),
          longitude: double.parse(json["longitude"].toString())

      );
    }
  }
}