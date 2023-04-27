import 'dart:convert';
import 'dart:io';

import 'package:restauranttdd0/features/product/data/dto/response/product_detail_response.dart';
import 'package:restauranttdd0/features/product/data/dto/response/product_response.dart';

Future<ProductResponse> productResponseOneFake() async {
  final file = await File('test/data/products/prouct_response_page_one.json')
      .readAsString();

  final Map<String, dynamic> json = jsonDecode(file);

  return ProductResponse.fromJson(json);
}

Future<ProductResponse> productResponseTwoFake() async {
  final file = await File('test/data/products/prouct_response_page_two.json')
      .readAsString();

  final Map<String, dynamic> json = jsonDecode(file);

  return ProductResponse.fromJson(json);
}

Future<ProductDetailResponse> productResponseDetail() async {
  final file = await File('test/data/products/prouct_detail_response.json')
      .readAsString();

  final Map<String, dynamic> json = jsonDecode(file);

  return ProductDetailResponse.fromJson(json);
}
