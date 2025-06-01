class StoresModel {
  String? name,image,website;
  List<ReviewModel>? reviews;
  List<ProductModel>? products;
  List<BranchModel>? branches;

  StoresModel(
      {this.name,
        this.image,
        this.website,
        this.reviews,
        this.products,
        this.branches
      });


  factory StoresModel.fromJson(Map<String, dynamic> json) {
    {

      return StoresModel(

          name: json["Name"],
          image: json["Image"],
          website: json["Website"],
          reviews: List<ReviewModel>.from(json["Reviews"].map((review)=>
              ReviewModel.fromJson(review)),),
          products: List<ProductModel>.from(json["Products"].map((product)=>
              ProductModel.fromJson(product)),),
          branches: List<BranchModel>.from(json["Branches"].map((branch)=>
              BranchModel.fromJson(branch)),),

      );
    }
  }
}

class ReviewModel {
  String? reviewerName,reviewerImage,reviewerComment,review,date;


  ReviewModel(
      {this.reviewerName,
        this.reviewerImage,
        this.reviewerComment,
        this.review,
        this.date
      });


  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    {
      return ReviewModel(

          reviewerName: json["Person Name"],
          reviewerImage: json["Person Image"],
          reviewerComment: json["Comment"],
          review: json["Review"],
          date: json["Date"]

      );
    }
  }
}

class BranchModel {
  String? address,longitude,latitude;


  BranchModel(
      {this.address,
        this.longitude,
        this.latitude
      });


  factory BranchModel.fromJson(Map<String, dynamic> json) {
    {
      return BranchModel(

          address: json["Address"],
          longitude: json["Longitude"],
          latitude: json["Latitude"],

      );
    }
  }
}

class ProductModel {
  String? name,image,price;


  ProductModel(
      {this.name,
        this.image,
        this.price
      });


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    {
      return ProductModel(

        name: json["Name"],
        image: json["Image"],
        price: json["Price"],

      );
    }
  }
}