import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/product/presentation/controller/product_controller.dart';
import '../../styles/dimens.dart';
import 'app_config_layout.dart';

abstract class AbstractUtilityProvider {
  static AutoDisposeStateNotifierProvider<WidgetPara,
          Map<String, WidgetParaProductsCardMode>>
      get widgetParaProvider => _widgetParaProvider;

  //-----------
  static StateNotifierProvider<RestaurantList, List<String>>
      get restaurantList1 => _restaurantList;
  static StateNotifierProvider<AppConfigLayOut, AppConfigLayOutModel>
      get appConfig => _appConfig;
  static StateNotifierProvider<WidgetConfig, Map<String, WidgetConfiguration>>
      get widgetConfig => _widgetConfig;
  static AutoDisposeStateNotifierProvider<TitleShowingOnProductCategoriesList,
          String>
      get titleShowingOnProductCategoriesList =>
          _titleShowingOnProductCategoriesList;
}

//-----------------------------------------------------------

final _widgetParaProvider = StateNotifierProvider.autoDispose<WidgetPara,
    Map<String, WidgetParaProductsCardMode>>((ref) {
  final productState = ref.watch(productControllerProvider);
  final categories = productState.categories;
  final products = productState.products;
  Map<String, WidgetParaProductsCardMode> widgetParaProductsCard = {};
  for (int index = 0; index < categories.length; index++) {
    if (index == 0) {
      final categoryName = categories[0];
      final productsForCategory = products
          .where((product) => product.category == categoryName)
          .toList();
      const startPixcel = 0.0;
      final productsCardHeight = WidgetParaData.productsCardHeight(
        heightOfAProuctCard: WidgetParaData.heightOfAProuctCard,
        crossAxisSpacingInGridCard: WidgetParaData.crossAxisSpacingInGridCard,
        numProducts: productsForCategory.length,
        productsPerRow: WidgetParaData.productsPerRow,
      );
      final endPixcel = WidgetParaData.endPixcel(
          heightOfProductCategory: WidgetParaData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle: WidgetParaData.heoghtOfRestaurantTitle,
          startPixcel: startPixcel);
      final halfPixcel = WidgetParaData.halfPixcel(
          theDistanceBewteentoHalf: WidgetParaData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);

      widgetParaProductsCard[categoryName] = WidgetParaProductsCardMode(
        hlafPixcel: halfPixcel,
        index: 0,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow:
            (productsForCategory.length / WidgetParaData.productsPerRow).ceil(),
        endPixcel: endPixcel,
        bottomDistance: WidgetParaData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        previousHalfPixcel: 0,
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
      final productsCardHeight = WidgetParaData.productsCardHeight(
        heightOfAProuctCard: WidgetParaData.heightOfAProuctCard,
        crossAxisSpacingInGridCard: WidgetParaData.crossAxisSpacingInGridCard,
        numProducts: productsForCategory.length,
        productsPerRow: WidgetParaData.productsPerRow,
      );

      final endPixcel = WidgetParaData.endPixcel(
          heightOfProductCategory: WidgetParaData.heightOfProductCategory,
          heightOfProuctsCard: productsCardHeight,
          heoghtOfRestaurantTitle: WidgetParaData.heoghtOfRestaurantTitle,
          startPixcel: startPixcel);

      final halfPixcel = WidgetParaData.halfPixcel(
          theDistanceBewteentoHalf: WidgetParaData.theDistanceBewteentoHalf,
          endPixcel: endPixcel);
      widgetParaProductsCard[categoryName] = WidgetParaProductsCardMode(
        hlafPixcel: halfPixcel,
        index: index,
        name: categoryName,
        productsLength: productsForCategory.length,
        startPixcel: startPixcel,
        numberOfRow:
            (productsForCategory.length / WidgetParaData.productsPerRow).ceil(),
        bottomDistance: WidgetParaData.theDistanceBewteentoHalf,
        productsCardHeight: productsCardHeight,
        endPixcel: endPixcel,
        previousHalfPixcel: previousHalfPixcel,
      );
    }

    // widgetParaProductsCard[categoryName] = productsForCategory;
  }
  return WidgetPara(widgetParaProductsCard);
});
final _restaurantList =
    StateNotifierProvider<RestaurantList, List<String>>((ref) {
  return RestaurantList();
});
final _widgetConfig =
    StateNotifierProvider<WidgetConfig, Map<String, WidgetConfiguration>>(
        (ref) {
  final restaurantList = ref.watch(AbstractUtilityProvider.restaurantList1);
  // final name = restaurantList[0];
  return WidgetConfig({
    'initial': WidgetConfiguration(
        name: 'initial',
        positionPixcel: 0,
        restaurantIndex: 0,
        widgetHeight: 0,
        widgetWidth: 0)
  });
});
final _titleShowingOnProductCategoriesList = StateNotifierProvider.autoDispose<
    TitleShowingOnProductCategoriesList, String>((ref) {
  final restaurantList = ref.watch(AbstractUtilityProvider.restaurantList1);

  final fistRestaurant = restaurantList[0];
  // final title = ref.watch(productCategoryProvider);
  return TitleShowingOnProductCategoriesList(fistRestaurant, ref);
});
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

    // print(state);
    // print('addWidgetConfiguration');
    // print(state);
  }

  // Map<String, double> get lacaotion {
  //   return state;
  // }

  // Map<String, double> getwidgetLocation() {
  //   return lacaotion;
  // }
}

class TitleShowingOnProductCategoriesList extends StateNotifier<String> {
  TitleShowingOnProductCategoriesList(String state, this.ref) : super(state);
  final Ref ref;

  void titleOnScreen({required String title}) {
    // print('TitleShowingOnProductCategoriesList abstract.utiliey titleOnScreen');
    state = title;
    // print(state);
  }
}

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

class WidgetPara
    extends StateNotifier<Map<String, WidgetParaProductsCardMode>> {
  final Map<String, WidgetParaProductsCardMode> state;
  WidgetPara(this.state) : super(state);

  void addWidgetPara(
      {required String name,
      required WidgetParaProductsCardMode widgetParaProductsCard}) {
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

class WidgetParaProductsCardMode {
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

  WidgetParaProductsCardMode(
      {required this.previousHalfPixcel,
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

class WidgetParaData {
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

class RestaurantList extends StateNotifier<List<String>> {
  RestaurantList() : super([]);

  void getRestaurantList({required List<String> restaurantList}) {
    // print('TitleShowingOnProductCategoriesList abstract.utiliey titleOnScreen');
    state = restaurantList;

    // print(state);
  }
}
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
