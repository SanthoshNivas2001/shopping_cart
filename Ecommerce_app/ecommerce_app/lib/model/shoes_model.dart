class ShoesModel {
  final String name;
  final String price;
  final String image;

  ShoesModel({
    required this.name,
    required this.price,
    required this.image,
  });

  factory ShoesModel.fromJson(Map<String, dynamic> json) {
    return ShoesModel(
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}
