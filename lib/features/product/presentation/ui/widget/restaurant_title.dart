import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/provider/utility_provider/utilityProvider.dart';
import '../../controller/product_controller.dart';
import '../../state/product_state.dart';

class RestuarantTitle extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final String restaurantName;

  final int restaurantIndex;
  RestuarantTitle(
      {required this.restaurantIndex,
      required this.scrollController,
      required this.restaurantName,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestuarantTitleState();
  int numberRebuld = 0;
  bool isHalf = false;
}

class _RestuarantTitleState extends ConsumerState<RestuarantTitle> {
  int number = 0;
  late double widgetPosition;
  double widgetHeight = 0;
  double widgetWidth = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // widgetPosition = box.localToGlobal(Offset.zero).dy +
      //     widget.scrollController.position.pixels;

      if (mounted) {
        final box = context.findRenderObject() as RenderBox;
        widgetHeight = box.size.height;
        widgetWidth = box.size.width;
        if (widget.numberRebuld > 0) {
          ref
              .read(AbstractUtilityProvider.widgetConfig.notifier)
              .addWidgetConfiguration(
                  restaurantIndex: widget.restaurantIndex,
                  ten: widget.restaurantName,
                  positionPixcel: widget.scrollController.position.pixels,
                  widgetHeight: widgetHeight,
                  widgetWidth: widgetWidth);
        }
        // ref
        //     .read(AbstractUtilityProvider.widgetConfig.notifier)
        //     .addWidgetConfiguration(
        //         restaurantIndex: widget.restaurantIndex,
        //         ten: widget.restaurantName,
        //         positionPixcel: widget.scrollController.position.pixels,
        //         widgetHeight: widgetHeight,
        //         widgetWidth: widgetWidth);
      }

      // ref.read(AbstractUtilityProvider.widgetLocation.notifier).addwidgetoffset(
      //     widget.localDataBaseRestaurantModel.restaurantName, widget.offsety);

      // print('intial widget.scrollController.position.pixels');
      // print(widget.scrollController.position.pixels);
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('build RestuarantTitle ${number}');

    // number++;
    // print(widget.restaurantName);
    // widget.numberRebuld++;
    // print(widget.numberRebuld);

    // print(widget.restaurantName);
    // print('build RestuarantTitle ');

    // print(widget.numberRebuld);

    widgetPosition = widget.scrollController.position.pixels;
    final initialPositionPixcel = widget.scrollController.position.pixels;
    WidgetConfiguration? testInirial =
        ref.watch(AbstractUtilityProvider.widgetConfig)[widget.restaurantName];

    // Future(() {}).then((value) {
    //   testInirial = ref
    //       .watch(AbstractUtilityProvider.widgetConfig)[widget.restaurantName];
    // });

    final categoryOnScreen = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    // final deviceHeight =
    //     ref.watch(AbstractUtilityProvider.appConfig).deviceHeight;

    // final widgetConfig_aliquam =
    //     ref.watch(AbstractUtilityProvider.widgetConfig)['aliquam'];
    // print('widget.restaurantName');
    // print(widget.restaurantName);
    // print(widgetConfig_aliquam?.positionPixcel);
    // final widgetIntitalPosition = widgetConfig_aliquam?.positionPixcel;
    // print('widget.scrollController');
    // print(widget.scrollController.position.pixels);
    //----------------------------------------------

    // print('widget.scrollController.position.userScrollDirection.index');
    // print(widget.scrollController.position.userScrollDirection.index);
    widget.scrollController.addListener(() {
      // if (testInirial != null) {
      //   print('testInirial');
      //   print(testInirial.positionPixcel);
      //   print(testInirial.name);
      // }

      // print(widget.restaurantName);
      // print(widget.scrollController.position.pixels);
      // print(initialPositionPixcel);
      // print(deviceHeight);
      // print('widget.scrollController.position.userScrollDirection.index');
      // print(widget.scrollController.position.userScrollDirection.index);
      // print(widget.scrollController.position.pixels -
      //     initialPositionPixcel -
      //     (deviceHeight / 2 + 100));

      if (mounted) {
        bool isScrollerUp =
            (widget.scrollController.position.userScrollDirection.index == 1);
        if (isScrollerUp) {
          // &&
          // widget.restaurantName == 'aliquam'
          // print('testInirial');
          // print(testInirial?.name);
          // print(testInirial?.positionPixcel);
          // bool isLowerThanHalf =
          //     (initialPositionPixcel - widget.scrollController.position.pixels >
          //         0);
          bool isLowerThanHalf1 = (initialPositionPixcel -
                  (testInirial?.positionPixcel ??
                      widget.scrollController.position.pixels) >
              200);
          // print(widget.scrollController.position.pixels > 4000);

          // bool tst = (initialPositionPixcel -
          //         (widget.scrollController.position.pixels) <
          //     400);
          // if (widget.restaurantName == 'aliquam') {
          //   // print(initialPositionPixcel);
          //   print('widgetPosition');
          //   print();
          // }
          if (isLowerThanHalf1) {
            ref.read(productControllerProvider.notifier).updateCategoryOnScreen(
                newCategoryOnScreen: CategoryOnScreenModel(
                    categoryIndex: widget.restaurantIndex,
                    categoryOnScreen: widget.restaurantName));
          }
        }
        // print('widget.scrollController.position.userScrollDirection.index');
        // print(widget.scrollController.position.userScrollDirection.index);
        // print(widget.restaurantName);
        // print('initialPositionPixcel');
        // print(initialPositionPixcel);
        // print('widget.scrollController.position.pixels');
        // print(widget.scrollController.position.pixels);
        // print('is half');

        // print(initialPositionPixcel - widget.scrollController.position.pixels);
        // print(initialPositionPixcel - widget.scrollController.position.pixels >
        //     60);
      }
      bool isScrollerPixcelGreaterThanProeductCard =
          (widget.scrollController.position.pixels >
              (initialPositionPixcel + widgetHeight));

      bool isScrollerDown =
          (widget.scrollController.position.userScrollDirection.index == 2);
      bool isScrollerIsGreaterThanHalf =
          (widget.scrollController.position.pixels >
              (initialPositionPixcel + (426 + 100)));
      if (isScrollerIsGreaterThanHalf &&
          mounted &&
          isScrollerPixcelGreaterThanProeductCard) {
        if (isScrollerDown) {
          if ((widget.restaurantName != categoryOnScreen?.categoryOnScreen) &&
              widget.restaurantIndex > (categoryOnScreen?.categoryIndex ?? 0)) {
            ref.read(productControllerProvider.notifier).updateCategoryOnScreen(
                newCategoryOnScreen: CategoryOnScreenModel(
                    categoryIndex: widget.restaurantIndex,
                    categoryOnScreen: widget.restaurantName));
          }
        }
      }
    });

    //----------------------------------------------
    // double widgetLocation = 0.0;

    // final widgetConfig = ref
    //     .watch(AbstractUtilityProvider.widgetLocation)[widget.restaurantName];
    // if (widgetConfig == null) {
    //   widgetLocation = widget.widgetPosition;
    // } else {
    //   widgetLocation = widget.widgetPosition;
    // }

// repellendus
    // get height of device
    Future(() {}).then((value) {
      // print('this Future trong RestuarantTitle');
      // print('widget.restaurantName');
      // print(widget.restaurantName);
      // print('widget.scrollController.position.pixels');
      // print(widget.scrollController.position.pixels);
      // print('widgetHeight');
      // print(widgetHeight);
      // print('widgetWidth');
      // print(widgetWidth);
      // ref
      //     .read(AbstractUtilityProvider.widgetConfig.notifier)
      //     .addWidgetConfiguration(
      //         restaurantIndex: widget.restaurantIndex,
      //         ten: widget.restaurantName,
      //         positionPixcel: widget.scrollController.position.pixels,
      //         widgetHeight: widgetHeight,
      //         widgetWidth: widgetWidth);
      // ref.read(AbstractUtilityProvider.widgetLocation.notifier).addwidgetoffset(
      //     widget.localDataBaseRestaurantModel.restaurantName,
      //     widget.innitionPosition);
    });
// &&
//           widget.scrollController.position.userScrollDirection.index == 1

    return Container(
      height: 20,
      width: 200,
      color: Colors.orange,
      alignment: Alignment.center,
      child: Text(widget.restaurantName, style: const TextStyle()),
    );
  }
}
