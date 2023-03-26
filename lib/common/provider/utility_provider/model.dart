import 'package:restauranttdd0/common/provider/utility_provider/utilityProvider.dart';

import '../../../features/product/domain/models/product.dart';

class WidgetRestaurantConfigMode {
  final int index;
  final String name;
  final double startPixcel;
  final double hlafPixcel;
  final int productsLength;
  final int numberOfRow;
  final double endPixcel;
  final double bottomDistance;
  final double productsCardHeight;
  final double previousHalfPixcel;
  final List<Product> productsForCategory;
  final int productsPerRow1;
  final double heightOfAProuctCard;
  final double heightOfARestaurant;
  WidgetRestaurantConfigMode(
      {required this.heightOfARestaurant,
      required this.heightOfAProuctCard,
      required this.productsPerRow1,
      required this.productsForCategory,
      required this.previousHalfPixcel,
      required this.productsCardHeight,
      required this.bottomDistance,
      required this.endPixcel,
      required this.numberOfRow,
      required this.productsLength,
      required this.index,
      required this.name,
      required this.startPixcel,
      required this.hlafPixcel});
}

class ProductsConfigEachRestaurantMode {
  final Map<int, ProductsOfEachRowConfig> productInformationMap;
  final int numberOfRow;
  final double restaurantPreviousHalfPixcel;
  final double restaurantStartPixcel;
  final double restaurantEndPixcel;
  final double restaurantHalfPixcel;
  final String restaurantName;
  final List<Product> allProductInRestaurant;
  ProductsConfigEachRestaurantMode({
    required this.allProductInRestaurant,
    required this.numberOfRow,
    required this.restaurantPreviousHalfPixcel,
    required this.restaurantHalfPixcel,
    required this.restaurantEndPixcel,
    required this.restaurantName,
    required this.productInformationMap,
    required this.restaurantStartPixcel,
  });
}

class ProductsOfEachRowConfig {
  final List<ProductInformation> productInformation;
  final double productStartPixcel;
  final double productEndPixcel;
  final int rowProductIndex;
  final String category;
  final List<Product> productList;
  ProductsOfEachRowConfig(
      {required this.category,
      required this.productList,
      required this.productInformation,
      required this.productStartPixcel,
      required this.productEndPixcel,
      required this.rowProductIndex});
}

class ProductInformation {
  final String productName;
  final String productDetailId;
  final int indexInRow;
  final String startCount;
  final String endCount;
  ProductInformation({
    required this.startCount,
    required this.endCount,
    required this.productName,
    required this.productDetailId,
    required this.indexInRow,
  });
}
