import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/app_const_data/size_config.dart';

import '../styles/dimens.dart';

class AppConstData {
  static const BaseURL = 'https://bazar.rdewan.dev/';
}

class WidgetProductsCardConfigData {
  static const fromTitleOfMiddleOf = 284.0;

  static const productsPerRow1 = 2;
  static const heightOfAProuctCard = 246.0;
  static const deviceheight = 852.0;
  static const deviceHeightHalf = deviceheight / 2;
  static const crossAxisSpacingInGridCard = kSmall;
  static const theDistanceBewteentoHalf = 340.0;

  //----------------------------- home Screen

  // width: getProportionateScreenWidth(100),
  static final homeBrandConfigHeight = getProportionateScreenHeight(90);
  static final homeBrandScrollingConfigCoverHeight =
      getProportionateScreenHeight(10);
  static final homeBrandScrollingConfigCoverWidth =
      getProportionateScreenWidth(97);
  static final homeBrandScrollingConfigDotWidth =
      getProportionateScreenWidth(20);
  static final homeBrandScrollingConfigDotHeight =
      getProportionateScreenHeight(10);
  static final homeBrandScrollingConfigDotMove = getProportionateScreenHeight(
      homeBrandScrollingConfigCoverWidth - homeBrandScrollingConfigDotWidth);
//-------------- restaurantTitle
  static const heightOfRestaurantTitle = 30.0;
  static const widthOfRestaurantTitle = 150.0;
  //------------------- ProductRightThumbView
  static const rightThumbPadViewHeight = 30.0;
  static const rightThumbViewWidth = 70.0;
  //----------------------------------- category

  static const heightOfProductCategory = 20.0;
  static const widthOfProductCategory = 70.0;
  //----------------------
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
