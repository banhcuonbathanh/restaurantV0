import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/product/domain/models/product.dart';
import '../../../features/product/presentation/controller/product_controller.dart';
import '../../styles/dimens.dart';
import 'app_config_layout.dart';

abstract class AbstractUtilityProvider {
  static AutoDisposeStateNotifierProvider<WidgetProductsCardConfig,
          Map<String, WidgetProductsCardConfigMode>>
      get widgetProductsCardConfigProvider => _widgetProductsCardConfigProvider;

  //-----------

  static StateNotifierProvider<AppConfigLayOut, AppConfigLayOutModel>
      get appConfig => _appConfig;
}

//-----------------------------------------------------------

//-----------------
final _widgetProductsCardConfigProvider = StateNotifierProvider.autoDispose<
    WidgetProductsCardConfig, Map<String, WidgetProductsCardConfigMode>>((ref) {
  final productState = ref.watch(productControllerProvider);
  final categories = productState.categories;
  final products = productState.products;
  Map<String, WidgetProductsCardConfigMode> widgetParaProductsCard = {};
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
        productsPerRow: WidgetProductsCardConfigData.productsPerRow,
      );
      final endPixcel = WidgetProductsCardConfigData.endPixcel(
          heightOfProductCategory:
              WidgetProductsCardConfigData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle:
              WidgetProductsCardConfigData.heoghtOfRestaurantTitle,
          startPixcel: startPixcel);
      final halfPixcel = WidgetProductsCardConfigData.halfPixcel(
          theDistanceBewteentoHalf:
              WidgetProductsCardConfigData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);

      widgetParaProductsCard[categoryName] = WidgetProductsCardConfigMode(
        hlafPixcel: halfPixcel,
        index: 0,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow: (productsForCategory.length /
                WidgetProductsCardConfigData.productsPerRow)
            .ceil(),
        endPixcel: endPixcel,
        bottomDistance: WidgetProductsCardConfigData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        previousHalfPixcel: 0,
        productsForCategory: productsForCategory,
        productsPerRow: WidgetProductsCardConfigData.productsPerRow,
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
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
          widgetParaProductsCard[previousCategory];
      final startPixcel = previousWidgetParaProductsCardMode!.endPixcel;
      final previousHalfPixcel = previousWidgetParaProductsCardMode.hlafPixcel;
      final productsCardHeight =
          WidgetProductsCardConfigData.productsCardHeight(
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
        crossAxisSpacingInGridCard:
            WidgetProductsCardConfigData.crossAxisSpacingInGridCard,
        numProducts: productsForCategory.length,
        productsPerRow: WidgetProductsCardConfigData.productsPerRow,
      );

      final endPixcel = WidgetProductsCardConfigData.endPixcel(
          heightOfProductCategory:
              WidgetProductsCardConfigData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle:
              WidgetProductsCardConfigData.heoghtOfRestaurantTitle,
          startPixcel: startPixcel);

      final halfPixcel = WidgetProductsCardConfigData.halfPixcel(
          theDistanceBewteentoHalf:
              WidgetProductsCardConfigData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);
      widgetParaProductsCard[categoryName] = WidgetProductsCardConfigMode(
        hlafPixcel: halfPixcel,
        index: index,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow: (productsForCategory.length /
                WidgetProductsCardConfigData.productsPerRow)
            .ceil(),
        bottomDistance: WidgetProductsCardConfigData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        endPixcel: endPixcel,
        previousHalfPixcel: previousHalfPixcel,
        productsForCategory: productsForCategory,
        productsPerRow: WidgetProductsCardConfigData.productsPerRow,
        heightOfAProuctCard: WidgetProductsCardConfigData.heightOfAProuctCard,
      );
    }

    // widgetParaProductsCard[categoryName] = productsForCategory;
  }
  return WidgetProductsCardConfig(widgetParaProductsCard);
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

class WidgetProductsCardConfig
    extends StateNotifier<Map<String, WidgetProductsCardConfigMode>> {
  final Map<String, WidgetProductsCardConfigMode> initialState;
  WidgetProductsCardConfig(this.initialState) : super(initialState);

  void addWidgetPara(
      {required String name,
      required WidgetProductsCardConfigMode widgetParaProductsCard}) {
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

class WidgetProductsCardConfigMode {
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
  final int productsPerRow;
  final double heightOfAProuctCard;

  WidgetProductsCardConfigMode(
      {required this.heightOfAProuctCard,
      required this.productsPerRow,
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

class WidgetProductsCardConfigData {
  static const fromTitleOfMiddleOf = 284.0;
  static const heightOfProductCategory = 20.0;
  static const heoghtOfRestaurantTitle = 20.0;

  static const productsPerRow = 2;
  static const heightOfAProuctCard = 246.0;
  static const deviceheight = 852.0;
  static const deviceHeightHalf = deviceheight / 2;
  static const crossAxisSpacingInGridCard = kSmall;
  static const theDistanceBewteentoHalf = 340.0;
  static double productsCardHeight({
    required double heightOfAProuctCard,
    required int productsPerRow,
    required int numProducts,
    required double crossAxisSpacingInGridCard,
  }) {
    final numberOfRow = (numProducts / productsPerRow).ceil();
    final heightOfcrossAxisSpacingInGridCard =
        crossAxisSpacingInGridCard * (numberOfRow - 1);

    final heightOfProduct = numberOfRow * heightOfAProuctCard;
    final totoalCardProductsHeight =
        heightOfProduct + heightOfcrossAxisSpacingInGridCard;
    ;
    //---------------------------------

    return totoalCardProductsHeight;
  }

  static double halfPixcel({
    required double endPixcel,
    required double theDistanceBewteentoHalf,
  }) {
    final halfPixcel = endPixcel - theDistanceBewteentoHalf + 30;
    //---------------------------------

    return halfPixcel;
  }

  static double endPixcel({
    required double startPixcel,
    required double heightOfProuctsCard,
    required double heightOfProductCategory,
    required double heoghtOfRestaurantTitle,
  }) {
    final endPixcel =
        heightOfProuctsCard + heoghtOfRestaurantTitle + startPixcel;

    //---------------------------------

    return endPixcel;
  }
}

//-----------------

final widgetAProductDetailConfigProvider = StateNotifierProvider.autoDispose<
    WidgetAProductDetailConfig,
    Map<String, ProductDetailsRowConfigMode>>((ref) {
  final widgetProductsCardConfigProvider =
      ref.watch(AbstractUtilityProvider.widgetProductsCardConfigProvider);

  final List<String> categories =
      widgetProductsCardConfigProvider.keys.toList();
  print('this is category trong widgetAProductDetailConfigProvider');
  categories.forEach((element) {
    print(element);
  });
  Map<String, ProductDetailsRowConfigMode> widgetAProductDetailConfig = {};

  for (int categoryIndex = 0;
      categoryIndex < categories.length;
      categoryIndex++) {
    final WidgetProductsCardConfigMode? widgetProductsCardConfigMode =
        widgetProductsCardConfigProvider[categories[categoryIndex]];

    final List<Product> categoryProducts =
        widgetProductsCardConfigMode!.productsForCategory;
    print('list of product ');
    print('categoryProducts.length');
    print(categoryProducts.length);
    categoryProducts.forEach((element) {
      print(element.name);
    });
    final productPerRow =
        widgetProductsCardConfigProvider[categories[categoryIndex]]!
            .productsPerRow;
    print('productPerRow');
    print(productPerRow);
    if (categoryIndex != 0 &&
        widgetProductsCardConfigProvider[categories[categoryIndex]] != null) {
      print('this is loop of category ');
      print('the category ${categories[categoryIndex]}');
      final WidgetProductsCardConfigMode? widgetProductsCardConfigMode =
          widgetProductsCardConfigProvider[categories[categoryIndex]];
      final int numberOfRow =
          widgetProductsCardConfigProvider[categories[categoryIndex]]!
              .numberOfRow;
      print('numberOfRow  ${numberOfRow}');

      final productLength =
          widgetProductsCardConfigProvider[categories[categoryIndex]]!
              .productsLength;
      print('productLength  ${productLength}');
      final List<ProductInformation> productInformation = [];
      final startCount = 0;
      print('startCount  ${startCount}');
      final endCount = (categoryIndex + productPerRow > productLength)
          ? productLength
          : categoryIndex + productPerRow;
      print('endCount  ${endCount}');
      for (int i = startCount; i < endCount; i++) {
        print('this is ProductInformation ${i}');
        print(ProductInformation(
            indexInRow: i,
            productDetailId: categoryProducts[i].id,
            productName: categoryProducts[i].name));
        productInformation.add(ProductInformation(
            indexInRow: i,
            productDetailId: categoryProducts[i].id,
            productName: categoryProducts[i].name));
      }
      Map<int, ProductIndexConfig> productInformationMap = {};
      for (int rowIndex = 0; rowIndex < numberOfRow; rowIndex++) {
        productInformationMap[rowIndex] = ProductIndexConfig(
            productEndPixcel: widgetProductsCardConfigMode!.previousHalfPixcel +
                widgetProductsCardConfigMode.heightOfAProuctCard,
            productInformation: productInformation,
            productStartPixcel: widgetProductsCardConfigMode.previousHalfPixcel,
            rowProductIndex: rowIndex);
      }
      widgetAProductDetailConfig[categories[categoryIndex]] =
          ProductDetailsRowConfigMode(
        productInformationMap: productInformationMap,
        restaurantEndPixcel: widgetProductsCardConfigMode!.endPixcel,
        restaurantHalfPixcel: widgetProductsCardConfigMode.hlafPixcel,
        restaurantName: widgetProductsCardConfigMode.name,
        restaurantStartPixcel: widgetProductsCardConfigMode.startPixcel,
        restaurantPreviousHalfPixcel:
            widgetProductsCardConfigMode.previousHalfPixcel,
        numberOfRow: numberOfRow,
      );
    }
    if (categoryIndex == 0 &&
        widgetProductsCardConfigProvider[categories[0]] != null) {
      final WidgetProductsCardConfigMode? widgetProductsCardConfigMode =
          widgetProductsCardConfigProvider[categories[0]];
      final int numberOfRow =
          widgetProductsCardConfigProvider[categories[0]]!.numberOfRow;

      final productLength =
          widgetProductsCardConfigProvider[categories[categoryIndex]]!
              .productsLength;
      final List<ProductInformation> productInformation = [];
      final startCount = categoryIndex;
      final endCount = (categoryIndex + productPerRow > productLength)
          ? productLength
          : categoryIndex + productPerRow;
      for (int i = startCount; i < endCount; i++) {
        productInformation.add(ProductInformation(
            indexInRow: i,
            productDetailId: categoryProducts[i].id,
            productName: categoryProducts[i].name));
      }
      Map<int, ProductIndexConfig> productInformationMap = {};
      for (int rowIndex = 0; rowIndex < numberOfRow + 1; rowIndex++) {
        productInformationMap[rowIndex] = ProductIndexConfig(
            productEndPixcel: widgetProductsCardConfigMode!.previousHalfPixcel +
                widgetProductsCardConfigMode.heightOfAProuctCard,
            productInformation: productInformation,
            productStartPixcel: widgetProductsCardConfigMode.previousHalfPixcel,
            rowProductIndex: rowIndex);
      }

      //---------------------
      widgetAProductDetailConfig[categories[0]] = ProductDetailsRowConfigMode(
        productInformationMap: productInformationMap,
        restaurantEndPixcel: widgetProductsCardConfigMode!.endPixcel,
        restaurantHalfPixcel: widgetProductsCardConfigMode.hlafPixcel,
        restaurantName: widgetProductsCardConfigMode.name,
        restaurantStartPixcel: widgetProductsCardConfigMode.startPixcel,
        restaurantPreviousHalfPixcel:
            widgetProductsCardConfigMode.previousHalfPixcel,
        numberOfRow: numberOfRow,
      );
    }
  }

  return WidgetAProductDetailConfig(widgetAProductDetailConfig);
});

class WidgetAProductDetailConfig
    extends StateNotifier<Map<String, ProductDetailsRowConfigMode>> {
  final Map<String, ProductDetailsRowConfigMode> initialState;
  WidgetAProductDetailConfig(this.initialState) : super(initialState);

  void addWidgetWidgetAProductDetailConfigMap(
      {required String categoryName,
      required int rowIndex,
      required ProductDetailsRowConfigMode widgetAProductDetailConfigMap}) {
    state[categoryName] = (widgetAProductDetailConfigMap);
  }
}

//------------------------

//------------------------
class ProductDetailsRowConfigMode {
  final Map<int, ProductIndexConfig> productInformationMap;
  final int numberOfRow;
  final double restaurantPreviousHalfPixcel;
  final double restaurantStartPixcel;
  final double restaurantEndPixcel;
  final double restaurantHalfPixcel;
  final String restaurantName;

  ProductDetailsRowConfigMode({
    required this.numberOfRow,
    required this.restaurantPreviousHalfPixcel,
    required this.restaurantHalfPixcel,
    required this.restaurantEndPixcel,
    required this.restaurantName,
    required this.productInformationMap,
    required this.restaurantStartPixcel,
  });
}

class ProductIndexConfig {
  final List<ProductInformation> productInformation;
  final double productStartPixcel;
  final double productEndPixcel;
  final int rowProductIndex;

  ProductIndexConfig(
      {required this.productInformation,
      required this.productStartPixcel,
      required this.productEndPixcel,
      required this.rowProductIndex});
}

class ProductInformation {
  final String productName;
  final String productDetailId;
  final int indexInRow;
  ProductInformation({
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
