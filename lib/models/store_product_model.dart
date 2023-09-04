
class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final Rating rating;
  final String category;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]), category: 'category',
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "rating": rating.toJson(),
      };
}
class Rating{
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
