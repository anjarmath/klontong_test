import 'package:klontong_management/feature/domain/entity/product.dart';

class KlontongProductModel extends KlontongProduct {
  const KlontongProductModel({
    required super.id,
    required super.categoryId,
    required super.categoryName,
    required super.sku,
    required super.name,
    required super.description,
    required super.weight,
    required super.width,
    required super.length,
    required super.height,
    required super.image,
    required super.harga,
  });

  factory KlontongProductModel.fromJson(Map<String, dynamic> json) =>
      KlontongProductModel(
        id: json["_id"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        weight: json["weight"],
        width: json["width"],
        length: json["length"],
        height: json["height"],
        image: json["image"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "categoryId": categoryId,
      "categoryName": categoryName,
      "sku": sku,
      "name": name,
      "description": description,
      "weight": weight,
      "width": width,
      "length": length,
      "height": height,
      "image": image,
      "harga": harga,
    };
  }
}
