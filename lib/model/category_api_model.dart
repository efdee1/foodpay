// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';



class Category {
  Category({
    this.categories,
  });

  Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

  String categoryToJson(Category data) => json.encode(data.toJson());

  List<CategoryElement>? categories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categories: List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class CategoryElement {
  CategoryElement({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
  };
}
