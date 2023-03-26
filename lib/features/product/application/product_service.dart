import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/common/app_const_data/app_const_data.dart';

import '../../../common/provider/currency_formatter.dart';
import '../../../core/exception/failure.dart';
import '../data/dto/response/product_detail_response.dart';
import '../data/dto/response/product_response.dart';
import '../data/repository/iproduct_repository.dart';
import '../data/repository/product_repository.dart';
import '../domain/mappers/product_detail_model_mapper.dart';
import '../domain/mappers/product_model_mapper.dart';
import '../domain/models/page.dart';
import '../domain/models/product.dart';
import '../domain/models/product_detail_model.dart';
import '../domain/models/product_model.dart';
import 'iproduct_service.dart';
import 'package:faker/faker.dart';

final productServiceProvider = Provider.autoDispose<IProductService>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  final baseUrl = AppConstData.BaseURL;

  return ProductService(productRepository, baseUrl, ref);
});

class ProductService
    implements IProductService, ProductModelMapper, ProductDetailModelMapper {
  final IProductRepository _productRepository;
  final String _baseUrl;
  final Ref _ref;

  ProductService(this._productRepository, this._baseUrl, this._ref);

  @override
  Future<Result<ProductModel, Failure>> getProducts(
      Map<String, dynamic> query) async {
    try {
      final response = await _productRepository.getProducts(query);
      final result = mapToProductModel(response, query);

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  ProductModel mapToProductModel(
      ProductResponse response, Map<String, dynamic> query) {
    return ProductModel(
      page: Page(
        currentPage: response.currentPage,
        perPage: response.perPage,
        lastPage: response.lastPage,
        total: response.total,
      ),
      products: response.data
          .map(
            (product) => Product(
              id: product.id,
              categoryId: product.categoryId + query['pageNumber'].toString(),
              brandId: product.brandId,
              sku: product.sku,
              name: faker.company.name() + product.category,
              shortDescription: product.shortDescription,
              longDescription: product.longDescription,
              thumbnail: '$_baseUrl${product.thumbnail}',
              images: '$_baseUrl${product.images}',
              isActive: int.parse(product.isActive),
              price: double.parse(product.price),
              discount: double.parse(product.discount),
              discountedPrice: calculateDiscountedPrice(
                double.parse(product.discount),
                double.parse(product.price),
              ),
              formattedPrice: formatPrice(product.currency, product.price),
              formattedDiscount:
                  double.parse(product.discount).toStringAsFixed(0),
              formattedDiscountedPrice: calculateFormattedDiscountedPrice(
                double.parse(product.discount),
                double.parse(product.price),
                product.currency,
              ),
              currency: product.currency,
              qty: int.parse(product.qty),
              category: product.category + query['pageNumber'].toString(),
              brand: product.brand,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<Result<ProductDetailModel, Failure>> getProduct(int id) async {
    try {
      final response = await _productRepository.getProduct(id);
      final result = mapToProductDetailModel(response);
      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  ProductDetailModel mapToProductDetailModel(ProductDetailResponse response) {
    final product = response.product;
    return ProductDetailModel(
      id: product.id,
      categoryId: product.categoryId,
      brandId: product.brandId,
      sku: product.sku,
      name: product.name,
      shortDescription: product.shortDescription,
      longDescription: product.longDescription,
      thumbnail: '$_baseUrl${product.thumbnail}',
      images: '$_baseUrl${product.images}',
      isActive: int.parse(product.isActive),
      price: double.parse(product.price),
      discount: double.parse(product.discount),
      discountedPrice: calculateDiscountedPrice(
        double.parse(product.discount),
        double.parse(product.price),
      ),
      formattedPrice: formatPrice(product.currency, product.price),
      formattedDiscount: double.parse(product.discount).toStringAsFixed(0),
      formattedDiscountedPrice: calculateFormattedDiscountedPrice(
        double.parse(product.discount),
        double.parse(product.price),
        product.currency,
      ),
      currency: product.currency,
      qty: int.parse(product.qty),
      category: product.category,
      brand: product.brand,
      productImages: response.images.map((e) => '$_baseUrl${e.image}').toList(),
    );
  }

  String formatPrice(String name, String price) {
    return _ref
        .read(currencyFormatterProvider(name))
        .format(double.parse(price));
  }

  double calculateDiscountedPrice(
    double discountPercent,
    double price,
  ) {
    return (price - (discountPercent / 100 * price));
  }

  String calculateFormattedDiscountedPrice(
    double discountPercent,
    double price,
    String currency,
  ) {
    return formatPrice(
      currency,
      (price - (discountPercent / 100 * price)).toString(),
    );
  }
}
