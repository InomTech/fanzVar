class UserModel {
  dynamic userId, email, name, image, phone, loginBy;

  // Constructor
  UserModel({
    this.userId,
    this.email,
    this.name,
    this.image,
    this.phone,
    this.loginBy,
  });

  // تحويل JSON إلى UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'] ?? "", // هنا نقرأ id من الـ JSON ونخزنها في userId
      email: json["email"],
      name: json["name"],
      image: json["image"],
      phone: json["phone"],
      loginBy: json["loginBy"],
    );
  }

  // تحويل UserModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': userId, // هنا نحول userId إلى id في الـ JSON
      'email': email,
      'name': name,
      'image': image,
      'phone': phone,
      'loginBy': loginBy,
    };
  }
}
