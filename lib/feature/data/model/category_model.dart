import 'package:klontong_management/feature/domain/entity/category.dart';

class KlontongCategoryModel extends KlontongCategory {
  const KlontongCategoryModel({
    required super.id,
    required super.categoryName,
  });

  factory KlontongCategoryModel.fromJson(Map<String, dynamic> json) =>
      KlontongCategoryModel(
        id: json["_id"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "categoryName": categoryName,
    };
  }
}
