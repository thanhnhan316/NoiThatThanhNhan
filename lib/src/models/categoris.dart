// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Categorie> CategorieFromJson(String str) =>
    List<Categorie>.from(json.decode(str).map((x) => Categorie.fromJson(x)));

String CategorieToJson(List<Categorie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categorie {
  Categorie({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.image,
    required this.numOfProducts,
  });

  String id;
  DateTime createdAt;
  String title;
  String image;
  int numOfProducts;

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        image: json["image"],
        numOfProducts: json["numOfProducts"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "image": image,
        "numOfProducts": numOfProducts,
      };
}
