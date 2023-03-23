import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../../common/class/break_point.dart';
import '../../../../../../common/mixin/loading_overlay.dart';
import '../../../../../../common/styles/dimens.dart';
import '../../../../../../common/widget/app_scaffold.dart';
import '../../../../../../common/widget/async_value_widget.dart';
import '../../../../../../common/widget/cache_image.dart';
import '../../../../domain/model/cart_item.dart';
import '../../../controller/cart_controller.dart';
import '../../widget/cart_price_widget.dart';
import 'cart_total_desktop_widget.dart';

class CartDesktopWidget extends ConsumerStatefulWidget {
  const CartDesktopWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CartDesktopWidget> createState() => _CartDesktopWidgetState();
}

class _CartDesktopWidgetState extends ConsumerState<CartDesktopWidget>
    with LoadingOverlay {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    _listener();

    final userCart =
        ref.watch(cartControllerProvider.select((value) => value.cartItems1));

    return AppScaffold(
      title: Text('Cart'.hardcoded),
      widget: AsyncValueWidget<List<CartItem>>(
        value: userCart,
        data: (data) {
          return Center(
            child: SizedBox(
              width: BreakPoint.desktop,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final cart = data[index];

                        return Dismissible(
                          key: ValueKey(cart.id),
                          direction: DismissDirection.endToStart,
                          dismissThresholds: const {
                            DismissDirection.endToStart: 0.6
                          },
                          background: const ColoredBox(
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.all(kMedium),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          confirmDismiss: (direction) =>
                              _confirmDismiss(direction, cart.id),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius: BorderRadius.circular(kSmall),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(kSmall),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CacheImage(
                                    imageUrl: cart.thumbnail,
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    width: kSmall,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cart.productName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.titleSmall,
                                        ),
                                        Text(
                                          cart.shortDescription,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodySmall,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CartPriceWidget(
                                              discount: cart.formattedDiscount,
                                              discountedPrice:
                                                  cart.formattedDiscountedPrice,
                                              price: cart.formattedPrice,
                                            ),

                                            const Spacer(),

                                            /// decrement the qty
                                            /// and update the cart, send request to api
                                            IconButton(
                                              onPressed: cart.qty == 1
                                                  ? null
                                                  : () {
                                                      ref
                                                          .read(
                                                              cartControllerProvider
                                                                  .notifier)
                                                          .decrementQty(
                                                              cart.id);

                                                      ref
                                                          .read(
                                                              cartControllerProvider
                                                                  .notifier)
                                                          .updateCart(cart.id);
                                                    },
                                              icon: const Icon(Icons.remove),
                                            ),

                                            Text(
                                              cart.qty.toString(),
                                              style:
                                                  context.textTheme.titleMedium,
                                            ),

                                            /// increment the qty
                                            /// and update the cart, send request to api
                                            IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(cartControllerProvider
                                                        .notifier)
                                                    .incrementQty(cart.id);

                                                ref
                                                    .read(cartControllerProvider
                                                        .notifier)
                                                    .updateCart(cart.id);
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const CartTotalDesktopWidget()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool?> _confirmDismiss(DismissDirection direction, int id) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Confirmation'.hardcoded),
          content: Text('Are you sure you want to delete this item'.hardcoded),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(cartControllerProvider.notifier).deleteFromCart(id);
                Navigator.of(context).pop(true);
              },
              child: Text('Delete'.hardcoded),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'.hardcoded),
            )
          ],
        );
      },
    );
  }

  void _listener() {
    ref.listen(cartControllerProvider.select((value) => value.isLoading),
        (previous, next) {
      if (next) {
        _overlayEntry = showLoadingOverlay(context, _overlayEntry);
      } else {
        _overlayEntry?.remove();
      }
    });
  }
}
