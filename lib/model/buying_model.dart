// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.sortKey,
    this.sortAsc,
    this.products,
  });

  String? sortKey;
  int? sortAsc;
  List<Product>? products;

  Products productsFromJson(String str) => Products.fromJson(json.decode(str));

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    sortKey: json["sort_key"],
    sortAsc: json["sort_asc"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sort_key": sortKey,
    "sort_asc": sortAsc,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.categoryId,
    this.shelfLife,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.isVatable,
    this.absorbVat,
    this.perishable,
    this.quantities,
    this.basicQtyIndex,
    this.smallestQtyIndex,
    this.isUpdated,
    this.excludeFromDiscount,
    this.views,
    this.totalQty,
    this.minInvLevel,
    this.minProcurement,
    this.procurementType,
    this.categoryName,
    this.inventoryCount,
    this.firstInventorySize,
    this.firstInventoryPrice,
  });

  String? id;
  String ?name;
  String? slug;
  String? image;
  String? description;
  String? categoryId;
  String? shelfLife;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? active;
  String? isVatable;
  String? absorbVat;
  String? perishable;
  List<Quantity>? quantities;
  String? basicQtyIndex;
  String? smallestQtyIndex;
  String? isUpdated;
  String? excludeFromDiscount;
  String? views;
  String? totalQty;
  String? minInvLevel;
  String? minProcurement;
  String? procurementType;
  String? categoryName;
  String? inventoryCount;
  String? firstInventorySize;
  String? firstInventoryPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    description: json["description"],
    categoryId: json["category_id"],
    shelfLife: json["shelf_life"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    active: json["active"],
    isVatable: json["is_vatable"],
    absorbVat: json["absorb_vat"],
    perishable: json["perishable"],
    quantities: List<Quantity>.from(json["quantities"].map((x) => Quantity.fromJson(x))),
    basicQtyIndex: json["basic_qty_index"],
    smallestQtyIndex: json["smallest_qty_index"],
    isUpdated: json["is_updated"],
    excludeFromDiscount: json["exclude_from_discount"],
    views: json["views"],
    totalQty: json["total_qty"],
    minInvLevel: json["min_inv_level"],
    minProcurement: json["min_procurement"],
    procurementType: json["procurement_type"],
    categoryName: json["category_name"],
    inventoryCount: json["inventory_count"],
    firstInventorySize: json["first_inventory_size"],
    firstInventoryPrice: json["first_inventory_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "description": description,
    "category_id": categoryId,
    "shelf_life": shelfLife,
    "deleted_at": deletedAt,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "active": active,
    "is_vatable": isVatable,
    "absorb_vat": absorbVat,
    "perishable": perishable,
    "quantities": List<dynamic>.from(quantities!.map((x) => x.toJson())),
    "basic_qty_index": basicQtyIndex,
    "smallest_qty_index": smallestQtyIndex,
    "is_updated": isUpdated,
    "exclude_from_discount": excludeFromDiscount,
    "views": views,
    "total_qty": totalQty,
    "min_inv_level": minInvLevel,
    "min_procurement": minProcurement,
    "procurement_type": procurementType,
    "category_name": categoryName,
    "inventory_count": inventoryCount,
    "first_inventory_size": firstInventorySize,
    "first_inventory_price": firstInventoryPrice,
  };
}

class Quantity {
  Quantity({
    this.name,
    this.price,
    this.b2BPrice,
    this.unitDiscountPercent,
    this.unitDiscount,
  });

  String? name;
  String? price;
  String? b2BPrice;
  String? unitDiscountPercent;
  int? unitDiscount;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
    name: json["name"],
    price: json["price"],
    b2BPrice: json["b2b_price"],
    unitDiscountPercent: json["unit_discount_percent"],
    unitDiscount: json["unit_discount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "b2b_price": b2BPrice,
    "unit_discount_percent": unitDiscountPercent,
    "unit_discount": unitDiscount,
  };
}
