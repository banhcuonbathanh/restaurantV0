import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String categoryId;
  final String brandId;
  final String sku;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String thumbnail;
  final String images;
  final int isActive;
  final double price;
  final double discount;
  final double discountedPrice;
  final String formattedPrice;
  final String formattedDiscount;
  final String formattedDiscountedPrice;
  final String currency;
  final int qty;
  final String category;
  final String brand;

  const Product({
    required this.id,
    required this.categoryId,
    required this.brandId,
    required this.sku,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.thumbnail,
    required this.images,
    required this.isActive,
    required this.price,
    required this.discount,
    required this.discountedPrice,
    required this.formattedPrice,
    required this.formattedDiscount,
    required this.formattedDiscountedPrice,
    required this.currency,
    required this.qty,
    required this.category,
    required this.brand,
  });

  @override
  List<Object> get props {
    return [
      id,
      categoryId,
      brandId,
      sku,
      name,
      shortDescription,
      longDescription,
      thumbnail,
      images,
      isActive,
      price,
      discount,
    ];
  }

  @override
  bool? get stringify => true;
}
