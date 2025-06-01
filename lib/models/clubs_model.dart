class ClubsModel {
  String? name, image, about, champions, address, numOfFans, website;
  double? lat, lng;

  ClubsModel(
      {this.name,
      this.image,
      this.about,
      this.champions,
      this.address,
      this.numOfFans,
      this.website,
      this.lat,
      this.lng});

  factory ClubsModel.fromJson(Map<String, dynamic> json) {
    {
      return ClubsModel(
        name: json["Club Name"],
        image: json["Image"],
        about: json["About"],
        champions: json["Champions"],
        address: json["Address"],
        numOfFans: json["Number Of Fans"],
        website: json["Website"],
        lat: json["latitude"],
        lng: json["longitude"],
      );
    }
  }
}
