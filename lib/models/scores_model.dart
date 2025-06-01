
class ScoresModel {
  String? club1Name,club1Image,club2Name,club2Image,score;


  ScoresModel(
      {this.club1Name,
        this.club1Image,
        this.club2Name,
        this.club2Image,
        this.score
      });


  factory ScoresModel.fromJson(Map<String, dynamic> json) {
    {

      return ScoresModel(

          club1Name: json["Club 1"],
          club2Name: json["Club 2"],
          club1Image: json["Club 1 Image"],
          club2Image: json["Club 2 Image"],
          score: json["Match Score"]

      );
    }
  }
}