// To parse this JSON data, do
//
//     final viewproduct = viewproductFromJson(jsonString);

import 'dart:convert';


class Viewproduct {
  Viewproduct({
    this.data,
    this.enableFbComments,
    this.socialMetaData,
  });
  Viewproduct viewproductFromJson(String str) => Viewproduct.fromJson(json.decode(str));

  String viewproductToJson(Viewproduct data) => json.encode(data.toJson());

  Data? data;
  int? enableFbComments;
  SocialMetaData? socialMetaData;

  factory Viewproduct.fromJson(Map<String, dynamic> json) => Viewproduct(
    data: Data.fromJson(json["data"]),
    enableFbComments: json["enable_fb_comments"],
    socialMetaData: SocialMetaData.fromJson(json["social_meta_data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "enable_fb_comments": enableFbComments,
    "social_meta_data": socialMetaData!.toJson(),
  };
}

class Data {
  Data({
    this.views,
    this.id,
    this.quantities,
    this.category,
  });

  String? views;
  int? id;
  dynamic quantities;
  String? category;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    views: json["views"],
    id: json["id"],
    quantities: json["quantities"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "views": views,
    "id": id,
    "quantities": quantities,
    "category": category,
  };
}

class SocialMetaData {
  SocialMetaData({
    this.title,
    this.type,
    this.card,
    this.siteName,
    this.description,
    this.image,
    this.creator,
    this.section,
    this.tag,
    this.publishedTime,
    this.modifiedTime,
    this.url,
    this.fbAdmin,
  });

  String? title;
  String? type;
  String? card;
  String? siteName;
  String? description;
  String? image;
  String? creator;
  String? section;
  String? tag;
  DateTime? publishedTime;
  DateTime? modifiedTime;
  String? url;
  String? fbAdmin;

  factory SocialMetaData.fromJson(Map<String, dynamic> json) => SocialMetaData(
    title: json["title"],
    type: json["type"],
    card: json["card"],
    siteName: json["site_name"],
    description: json["description"],
    image: json["image"],
    creator: json["creator"],
    section: json["section"],
    tag: json["tag"],
    publishedTime: DateTime.parse(json["published_time"]),
    modifiedTime: DateTime.parse(json["modified_time"]),
    url: json["url"],
    fbAdmin: json["fb_admin"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type,
    "card": card,
    "site_name": siteName,
    "description": description,
    "image": image,
    "creator": creator,
    "section": section,
    "tag": tag,
    "published_time": publishedTime!.toIso8601String(),
    "modified_time": modifiedTime!.toIso8601String(),
    "url": url,
    "fb_admin": fbAdmin,
  };
}
