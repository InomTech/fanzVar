class PromosModel {
  String? name,value;


  PromosModel(
      {this.name,
        this.value
      });


  factory PromosModel.fromJson(Map<String, dynamic> json) {
    {

      return PromosModel(

          name: json["Name"],
          value: json["Value"],

      );
    }
  }
}