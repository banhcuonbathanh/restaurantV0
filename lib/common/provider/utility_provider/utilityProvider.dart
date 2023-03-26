import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/product/domain/models/product.dart';
import '../../../features/product/presentation/controller/product_controller.dart';

import '../../app_const_data/app_const_data.dart';
import 'app_config_layout.dart';

abstract class AbstractUtilityProvider {
  static AutoDisposeStateNotifierProvider<WidgetRestaurantConfig,
          Map<String, WidgetRestaurantConfigMode>>
      get widgetRestaurantConfigProvider => _widgetRestaurantConfigProvider;

  //-----------

  static StateNotifierProvider<AppConfigLayOut, AppConfigLayOutModel>
      get appConfig => _appConfig;
}

//-----------------------------------------------------------

//-----------------
final _widgetRestaurantConfigProvider = StateNotifierProvider.autoDispose<
    WidgetRestaurantConfig, Map<String, WidgetRestaurantConfigMode>>((ref) {
  final productState = ref.watch(productControllerProvider);
  final categories = productState.categories;
  final products = productState.products;
  Map<String, WidgetRestaurantConfigMode> widgetRestaurantConfigMode = {};
  for (int index = 0; index < categories.length; index++) {
    if (index == 0) {
      final categoryName = categories[0];
      final productsForCategory = products
          .where((product) => product.category == categoryName)
          .toList();
      const startPixcel = 0.0;
      final productsCardHeight =
          WidgetProductsCardConfigData.productsCardHeight(
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
        crossAxisSpacingInGridCard:
            WidgetProductsCardConfigData.crossAxisSpacingInGridCard,
        numProducts: productsForCategory.length,
        productsPerRow: WidgetProductsCardConfigData.productsPerRow1,
      );
      final endPixcel = WidgetProductsCardConfigData.endPixcel(
          heightOfProductCategory:
              WidgetProductsCardConfigData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle:
              WidgetProductsCardConfigData.heightOfRestaurantTitle,
          startPixcel: startPixcel);
      final halfPixcel = WidgetProductsCardConfigData.halfPixcel(
          theDistanceBewteentoHalf:
              WidgetProductsCardConfigData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);

      widgetRestaurantConfigMode[categoryName] = WidgetRestaurantConfigMode(
        hlafPixcel: halfPixcel,
        index: 0,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow: (productsForCategory.length /
                WidgetProductsCardConfigData.productsPerRow1)
            .ceil(),
        endPixcel: endPixcel,
        bottomDistance: WidgetProductsCardConfigData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        previousHalfPixcel: 0,
        productsForCategory: productsForCategory,
        productsPerRow1: WidgetProductsCardConfigData.productsPerRow1,
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
        heightOfARestaurant:
            WidgetProductsCardConfigData.heightOfRestaurantTitle,
      );
    }
    if (index > 0) {
      final categoryName = categories[index];
      // print('_widgetParaProvider else case');
      // print(categoryName);
      final productsForCategory = products
          .where((product) => product.category == categoryName)
          .toList();
      // print(productsForCategory.length);
      final previousCategory = categories[index - 1];
      final previousWidgetParaProductsCardMode =
          widgetRestaurantConfigMode[previousCategory];
      final startPixcel = previousWidgetParaProductsCardMode!.endPixcel;
      final previousHalfPixcel = previousWidgetParaProductsCardMode.hlafPixcel;
      final productsCardHeight =
          WidgetProductsCardConfigData.productsCardHeight(
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
        crossAxisSpacingInGridCard:
            WidgetProductsCardConfigData.crossAxisSpacingInGridCard,
        numProducts: productsForCategory.length,
        productsPerRow: WidgetProductsCardConfigData.productsPerRow1,
      );

      final endPixcel = WidgetProductsCardConfigData.endPixcel(
          heightOfProductCategory:
              WidgetProductsCardConfigData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle:
              WidgetProductsCardConfigData.heightOfRestaurantTitle,
          startPixcel: startPixcel);

      final halfPixcel = WidgetProductsCardConfigData.halfPixcel(
          theDistanceBewteentoHalf:
              WidgetProductsCardConfigData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);
      widgetRestaurantConfigMode[categoryName] = WidgetRestaurantConfigMode(
        hlafPixcel: halfPixcel,
        index: index,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow: (productsForCategory.length /
                WidgetProductsCardConfigData.productsPerRow1)
            .ceil(),
        bottomDistance: WidgetProductsCardConfigData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        endPixcel: endPixcel,
        previousHalfPixcel: previousHalfPixcel,
        productsForCategory: productsForCategory,
        productsPerRow1: WidgetProductsCardConfigData.productsPerRow1,
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
        heightOfARestaurant:
            WidgetProductsCardConfigData.heightOfRestaurantTitle,
      );
    }

    // widgetParaProductsCard[categoryName] = productsForCategory;
  }
  return WidgetRestaurantConfig(widgetRestaurantConfigMode);
});
// final _restaurantList =
//     StateNotifierProvider<RestaurantList, List<String>>((ref) {
//   return RestaurantList();
// });

final _appConfig =
    StateNotifierProvider<AppConfigLayOut, AppConfigLayOutModel>((ref) {
  return AppConfigLayOut();
});

//-------------------------------------------------
class WidgetConfig extends StateNotifier<Map<String, WidgetConfiguration>> {
  WidgetConfig(Map<String, WidgetConfiguration> state) : super(state);

  void addWidgetConfiguration({
    required String ten,
    required double widgetHeight,
    required double widgetWidth,
    required int restaurantIndex,
    required double positionPixcel,
  }) {
    state.putIfAbsent(
        ten,
        () => WidgetConfiguration(
              restaurantIndex: restaurantIndex,
              name: ten,
              widgetHeight: widgetHeight,
              widgetWidth: widgetWidth,
              positionPixcel: positionPixcel,
            ));
  }
}

//------------------------------------

class AppConfigLayOut extends StateNotifier<AppConfigLayOutModel> {
  AppConfigLayOut(

      // this.ref,
      )
      : super(AppConfigLayOutModel());
  // final Ref ref;

  // final int phoneLimit = 550;
  final int tabletLimit = 600;
  final int destop = 900;
  void initAppConfig({required BuildContext context}) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeigh = MediaQuery.of(context).size.height;
    final deviceOriented = MediaQuery.of(context).orientation;
    state = state.copyWith(orientation: deviceOriented.toString());
    state = state.copyWith(deviceHeight: deviceHeigh);
    state = state.copyWith(deviceWith: deviceWidth);
    if (kIsWeb) {
      state = state.copyWith(isWeb: true, isApplication: false);
    } else {
      state = state.copyWith(isApplication: true, isWeb: false);
    }
    if (deviceWidth < tabletLimit) {
      state = state.copyWith(
          isPhone: true,
          isDesktop: false,
          isTablet: false,
          isApplication: true,
          isWeb: false);
    }
    if (deviceWidth > tabletLimit && deviceWidth < destop) {
      state = state.copyWith(
          isPhone: false,
          isDesktop: false,
          isTablet: true,
          isApplication: true,
          isWeb: false);
    }
    if (deviceWidth > destop) {
      state = state.copyWith(
          isPhone: false,
          isDesktop: true,
          isTablet: false,
          isApplication: true,
          isWeb: false);
    }
  }
}

class WidgetRestaurantConfig
    extends StateNotifier<Map<String, WidgetRestaurantConfigMode>> {
  final Map<String, WidgetRestaurantConfigMode> initialState;
  WidgetRestaurantConfig(this.initialState) : super(initialState);

  void addWidgetPara(
      {required String name,
      required WidgetRestaurantConfigMode widgetParaProductsCard}) {
    if (state.containsKey(name)) {
      state[name] = (widgetParaProductsCard);
    } else {
      state[name] = (widgetParaProductsCard);
    }
  }
  // void addWidgetPara(
  //     {required String name,
  //     required WidgetParaProductsCardMode widgetParaProductsCard}) {
  //   if (state.containsKey(name)) {
  //     state[name]!.add(widgetParaProductsCard);
  //   } else {
  //     state.putIfAbsent(name, () => widgetParaProductsCard);
  //   }
  // }
}

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

//-----------------

final productsOfAllRestaurantConfigProvider = StateNotifierProvider.autoDispose<
    ProductsOfAllRestaurantConfig,
    Map<String, ProductsConfigEachRestaurantMode>>((ref) {
  final allRestaurantsConfigProvider =
      ref.watch(AbstractUtilityProvider.widgetRestaurantConfigProvider);

  final List<String> allCategories = allRestaurantsConfigProvider.keys.toList();

  Map<String, ProductsConfigEachRestaurantMode> widgetAProductDetailConfig = {};

  for (int categoryIndex = 0;
      categoryIndex < allCategories.length;
      categoryIndex++) {
    // final WidgetRestaurantConfigMode? widgetRestaurantConfigMode =
    //     allRestaurantsConfigProvider[allCategories[categoryIndex]];

    // final List<Product> categoryProducts =
    //     widgetRestaurantConfigMode!.productsForCategory;

    final productPerRow =
        allRestaurantsConfigProvider[allCategories[categoryIndex]]!
            .productsPerRow1;

    if (categoryIndex != 0 &&
        allRestaurantsConfigProvider[allCategories[categoryIndex]] != null) {
      final WidgetRestaurantConfigMode? widgetRestaurantConfigMode =
          allRestaurantsConfigProvider[allCategories[categoryIndex]];

      final List<Product> categoryProducts =
          widgetRestaurantConfigMode!.productsForCategory;
      final int numberOfRow =
          allRestaurantsConfigProvider[allCategories[categoryIndex]]!
              .numberOfRow;

      final productLength =
          allRestaurantsConfigProvider[allCategories[categoryIndex]]!
              .productsLength;

      Map<int, ProductsOfEachRowConfig> productInformationMap = {};

      for (int rowIndex = 0; rowIndex < numberOfRow; rowIndex++) {
//--------------------------------------------

        final List<ProductInformation> productInformation = [];
        // const int startCount = 0;
        // const int endCount = 2;
        // final startCount = rowIndex * productPerRow;
        final startCount = rowIndex * 2;

        final endCount =
            (startCount + 2 > productLength) ? productLength : startCount + 2;

        for (int i = startCount; i < endCount; i++) {
          productInformation.add(ProductInformation(
              indexInRow: i,
              productDetailId: categoryProducts[i].id,
              productName: categoryProducts[i].name,
              endCount: endCount.toString(),
              startCount: startCount.toString()));
        }

//-------------------------------------------------

        productInformationMap[rowIndex] = ProductsOfEachRowConfig(
          productEndPixcel: widgetRestaurantConfigMode.previousHalfPixcel +
              ((rowIndex + 1) *
                  widgetRestaurantConfigMode.heightOfAProuctCard) +
              widgetRestaurantConfigMode.heightOfARestaurant,
          productInformation: productInformation,
          productStartPixcel: widgetRestaurantConfigMode.previousHalfPixcel +
              (rowIndex * widgetRestaurantConfigMode.heightOfAProuctCard) +
              widgetRestaurantConfigMode.heightOfARestaurant,
          rowProductIndex: rowIndex,
          category: allCategories[categoryIndex],
          productList: categoryProducts,
        );
      }
      widgetAProductDetailConfig[allCategories[categoryIndex]] =
          ProductsConfigEachRestaurantMode(
        productInformationMap: productInformationMap,
        restaurantEndPixcel: widgetRestaurantConfigMode.endPixcel,
        restaurantHalfPixcel: widgetRestaurantConfigMode.hlafPixcel,
        restaurantName: widgetRestaurantConfigMode.name,
        restaurantStartPixcel: widgetRestaurantConfigMode.startPixcel,
        restaurantPreviousHalfPixcel:
            widgetRestaurantConfigMode.previousHalfPixcel,
        numberOfRow: numberOfRow,
        allProductInRestaurant: categoryProducts,
      );
    }
    if (categoryIndex == 0 &&
        allRestaurantsConfigProvider[allCategories[0]] != null) {
      final WidgetRestaurantConfigMode? widgetRestaurantConfigMode =
          allRestaurantsConfigProvider[allCategories[0]];
      final int numberOfRow =
          allRestaurantsConfigProvider[allCategories[0]]!.numberOfRow;

      final productLength =
          allRestaurantsConfigProvider[allCategories[categoryIndex]]!
              .productsLength;
      final List<ProductInformation> productInformation = [];
      const int startCount = 0;
      // const int endCount = 2;
      // final startCount = categoryIndex;
      final List<Product> categoryProducts =
          widgetRestaurantConfigMode!.productsForCategory;

      for (int i = startCount; i < categoryProducts.length; i++) {
        productInformation.add(ProductInformation(
            endCount: categoryProducts.length.toString(),
            startCount: startCount.toString(),
            indexInRow: i,
            productDetailId: categoryProducts[i].id,
            productName: categoryProducts[i].name));
      }
      Map<int, ProductsOfEachRowConfig> productInformationMap = {};
      for (int rowIndex = 0; rowIndex < 1; rowIndex++) {
        productInformationMap[rowIndex] = ProductsOfEachRowConfig(
          productEndPixcel: widgetRestaurantConfigMode.previousHalfPixcel +
              widgetRestaurantConfigMode.heightOfAProuctCard,
          productInformation: productInformation,
          productStartPixcel: widgetRestaurantConfigMode.previousHalfPixcel,
          rowProductIndex: rowIndex,
          category: allCategories[0],
          productList: categoryProducts,
        );
      }

      //---------------------
      widgetAProductDetailConfig[allCategories[0]] =
          ProductsConfigEachRestaurantMode(
        productInformationMap: productInformationMap,
        restaurantEndPixcel: widgetRestaurantConfigMode.endPixcel,
        restaurantHalfPixcel: widgetRestaurantConfigMode.hlafPixcel,
        restaurantName: widgetRestaurantConfigMode.name,
        restaurantStartPixcel: widgetRestaurantConfigMode.startPixcel,
        restaurantPreviousHalfPixcel:
            widgetRestaurantConfigMode.previousHalfPixcel,
        numberOfRow: numberOfRow,
        allProductInRestaurant: categoryProducts,
      );
    }
  }

  return ProductsOfAllRestaurantConfig(widgetAProductDetailConfig);
});

class ProductsOfAllRestaurantConfig
    extends StateNotifier<Map<String, ProductsConfigEachRestaurantMode>> {
  final Map<String, ProductsConfigEachRestaurantMode> initialState;
  ProductsOfAllRestaurantConfig(this.initialState) : super(initialState);

  void addWidgetWidgetAProductDetailConfigMap(
      {required String categoryName,
      required int rowIndex,
      required ProductsConfigEachRestaurantMode
          widgetAProductDetailConfigMap}) {
    state[categoryName] = (widgetAProductDetailConfigMap);
  }
}

//------------------------

//------------------------
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
//------------
// class RestaurantList extends StateNotifier<List<String>> {
//   RestaurantList() : super([]);

//   void getRestaurantList({required List<String> restaurantList}) {
//     // print('TitleShowingOnProductCategoriesList abstract.utiliey titleOnScreen');
//     state = restaurantList;

//     // print(state);
//   }
// }
// class AppConfigLayOut {
//   final bool isPhone;
//   final bool isTablet;
//   final bool isDesktop;
//   final bool isWeb;
//   final bool isApplication;
//   final String orientation;

//   AppConfigLayOut({
//     this.orientation = '',
//     this.isWeb = false,
//     this.isApplication = false,
//     this.isTablet = false,
//     this.isDesktop = false,
//     this.isPhone = false,
//   });
// }

class WidgetConfiguration {
  final String name;
  final double widgetHeight;
  final double widgetWidth;
  final int restaurantIndex;
  final double positionPixcel;

  WidgetConfiguration(
      {required this.positionPixcel,
      required this.widgetHeight,
      required this.widgetWidth,
      required this.name,
      required this.restaurantIndex});
}
