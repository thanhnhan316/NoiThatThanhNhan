// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Product> ProductFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String ProductToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.subTitle,
    required this.description,
  });

  String id;
  DateTime createdAt;
  String title;
  int price;
  String category;
  String image;
  String subTitle;
  String description;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
        subTitle: json["subTitle"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "price": price,
        "category": category,
        "image": image,
        "subTitle": subTitle,
        "description": description,
      };
}
