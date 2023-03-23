import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../setting/presentation/controller/setting_controller.dart';
import '../../application/cart_service.dart';
import '../../domain/model/cart_item.dart';
import '../state/cart_state.dart';

// AddToCartModel(cartItem: CartItem(id: 92, userId: 7, productId: 3, productName: She said the., shortDescription: Tenetur rerum., qty: 43, price: 9.39, formattedPrice: $9.39, discountedPrice: 9.3, formattedDiscountedPrice: $9.30, discount: 1.0, formattedDiscount: 1, lineAmount: 399.73, thumbnail: https://bazar.rdewan.dev//storage/product/thumbnails/a26ceb4c814233a563fcb835a8a4c111.jpg), formattedTotal: $11,615.16, badgeCount: 3)
final cartControllerProvider = NotifierProvider<CartController, CartState>(() {
  return CartController();
});

class CartController extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState();
  }

  void getUserCart1() async {
    final id =
        await ref.read(settingControllerProvider.notifier).getUserIdFromBox();

    final service = ref.read(cartServiceProvider);
    final result = await service.getUserCart(id);

    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          cartItems1: AsyncValue.data(success.cartItem),
          cartTotal: success.formattedTotal,
          badgeCount: success.badgeCount,
        );
      },
      (error) {
        state = state.copyWith(
          cartItems1: AsyncError(error, error.stackTrace),
        );
      },
    );
  }

  void addToCart(Map<String, dynamic> item) async {
    state = state.copyWith(isLoading: true, errorMsg: null);
    final oldItems = state.cartItems1.value ?? [];
    List<CartItem> cartItem = [];
    final productId = item['product_id'];

    if (oldItems.isNotEmpty) {
      cartItem =
          oldItems.where((e) => e.productId == int.parse(productId)).toList();
    }

    final server = ref.read(cartServiceProvider);
    final result = await server.addToCart(item);

    result.when(
      (success) {
        if (cartItem.isNotEmpty) {
          state = state.copyWith(
            isLoading: false,
            badgeCount: success.badgeCount,
            cartTotal: success.formattedTotal,
            cartItems1: AsyncData([
              for (final item in oldItems)
                if (item.id == success.cartItem.id)
                  item.copyWith(
                    qty: success.cartItem.qty,
                    price: success.cartItem.price,
                    formattedPrice: success.cartItem.formattedPrice,
                    discount: success.cartItem.discount,
                    discountedPrice: success.cartItem.discountedPrice,
                    formattedDiscountedPrice:
                        success.cartItem.formattedDiscountedPrice,
                  )
                else
                  item
            ]),
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            badgeCount: success.badgeCount,
            cartItems1: AsyncData([success.cartItem, ...oldItems]),
            cartTotal: success.formattedTotal,
          );
        }
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMsg: error.message,
        );
      },
    );
  }

  void updateCart(int id) async {
    state = state.copyWith(isLoading: true, errorMsg: null);

    final oldItems = state.cartItems1.value ?? [];
    final queries = _prepareUpdateItem(id);
    final service = ref.read(cartServiceProvider);
    final result = await service.updateCart(queries);

    result.when((success) {
      state = state.copyWith(
        isLoading: false,
        badgeCount: success.badgeCount,
        cartTotal: success.formattedTotal,
        cartItems1: AsyncData([
          for (final item in oldItems)
            if (item.id == success.cartItem.id)
              item.copyWith(
                qty: success.cartItem.qty,
                price: success.cartItem.price,
                formattedPrice: success.cartItem.formattedPrice,
                discount: success.cartItem.discount,
                discountedPrice: success.cartItem.discountedPrice,
                formattedDiscountedPrice:
                    success.cartItem.formattedDiscountedPrice,
              )
            else
              item
        ]),
      );
    }, (error) {
      state = state.copyWith(
        isLoading: false,
        errorMsg: error.message,
      );
    });
  }

  void deleteFromCart(int id) async {
    state = state.copyWith(isLoading: true, errorMsg: null);

    final service = ref.read(cartServiceProvider);
    final result = await service.deleteFromCart(id);

    // result.when((success) {
    //   print('success this is addToCart trong CartController ');
    //   final oldItems = state.cartItems1.value ?? [];
    //   state = state.copyWith(
    //     isLoading: false,
    //     cartTotal: success.formattedCartTotal,
    //     badgeCount: success.badgeCount,
    //     cartItems1: AsyncData(
    //       List.from(oldItems)..removeWhere((e) => e.id == id),
    //     ),
    //   );
    // }, (error) {
    //   state = state.copyWith(
    //     isLoading: false,
    //     errorMsg: error.message,
    //   );
    // });
  }

  Map<String, dynamic> _prepareUpdateItem(int id) {
    double lineAmount = 0.0;
    final oldItems = state.cartItems1.value ?? [];
    final product = oldItems.firstWhere((e) => e.id == id);

    final discount = product.discount;
    final discountedPrice = product.discountedPrice;
    final price = product.price;
    final qty = product.qty;

    if (discount > 0.0) {
      lineAmount = qty * discountedPrice;
    } else {
      lineAmount = qty * price;
    }

    final item = {
      'id': id,
      'qty': qty,
      'price': price,
      'discount': discount,
      'discounted_price': discountedPrice,
      'line_amount': lineAmount,
    };

    return item;
  }

  void incrementQty(int id) {
    final oldItems = state.cartItems1.value ?? [];
    state = state.copyWith(
      cartItems1: AsyncData([
        for (final item in oldItems)
          if (item.id == id) item.copyWith(qty: item.qty + 1) else item
      ]),
    );
  }

  void decrementQty(int id) {
    final oldItems = state.cartItems1.value ?? [];
    state = state.copyWith(
      cartItems1: AsyncData([
        for (final item in oldItems)
          if (item.id == id) item.copyWith(qty: item.qty - 1) else item
      ]),
    );
  }
}

// @riverpod
// class CartController extends _$CartController {
//   @override
//   CartState build() {
//     return const CartState();
//   }

//   void getUserCart() async {
//     final id =
//         await ref.read(settingControllerProvider.notifier).getUserIdFromBox();

//     final service = ref.read(cartServiceProvider);
//     final result = await service.getUserCart(id);

//     result.when(
//       (success) {
//         state = state.copyWith(
//           isLoading: false,
//           cartItems: AsyncValue.data(success.cartItem),
//           cartTotal: success.formattedTotal,
//           badgeCount: success.badgeCount,
//         );
//       },
//       (error) {
//         state = state.copyWith(
//           cartItems: AsyncError(error, error.stackTrace),
//         );
//       },
//     );
//   }

//   void addToCart(Map<String, dynamic> item) async {
//     state = state.copyWith(isLoading: true, errorMsg: null);
//     final oldItems = state.cartItems.value ?? [];
//     List<CartItem> cartItem = [];
//     final productId = item['product_id'];

//     if (oldItems.isNotEmpty) {
//       cartItem =
//           oldItems.where((e) => e.productId == int.parse(productId)).toList();
//     }

//     final server = ref.read(cartServiceProvider);
//     final result = await server.addToCart(item);

//     result.when(
//       (success) {
//         print('this is addToCart trong cart controller');
//         print(success);
//         if (cartItem.isNotEmpty) {
//           state = state.copyWith(
//             isLoading: false,
//             badgeCount: success.badgeCount,
//             cartTotal: success.formattedTotal,
//             cartItems: AsyncData([
//               for (final item in oldItems)
//                 if (item.id == success.cartItem.id)
//                   item.copyWith(
//                     qty: success.cartItem.qty,
//                     price: success.cartItem.price,
//                     formattedPrice: success.cartItem.formattedPrice,
//                     discount: success.cartItem.discount,
//                     discountedPrice: success.cartItem.discountedPrice,
//                     formattedDiscountedPrice:
//                         success.cartItem.formattedDiscountedPrice,
//                   )
//                 else
//                   item
//             ]),
//           );
//         } else {
//           state = state.copyWith(
//             isLoading: false,
//             badgeCount: success.badgeCount,
//             cartItems: AsyncData([success.cartItem, ...oldItems]),
//             cartTotal: success.formattedTotal,
//           );
//         }
//       },
//       (error) {
//         state = state.copyWith(
//           isLoading: false,
//           errorMsg: error.message,
//         );
//       },
//     );
//   }

//   void updateCart(int id) async {
//     state = state.copyWith(isLoading: true, errorMsg: null);

//     final oldItems = state.cartItems.value ?? [];
//     final queries = _prepareUpdateItem(id);
//     final service = ref.read(cartServiceProvider);
//     final result = await service.updateCart(queries);

//     result.when((success) {
//       state = state.copyWith(
//         isLoading: false,
//         badgeCount: success.badgeCount,
//         cartTotal: success.formattedTotal,
//         cartItems: AsyncData([
//           for (final item in oldItems)
//             if (item.id == success.cartItem.id)
//               item.copyWith(
//                 qty: success.cartItem.qty,
//                 price: success.cartItem.price,
//                 formattedPrice: success.cartItem.formattedPrice,
//                 discount: success.cartItem.discount,
//                 discountedPrice: success.cartItem.discountedPrice,
//                 formattedDiscountedPrice:
//                     success.cartItem.formattedDiscountedPrice,
//               )
//             else
//               item
//         ]),
//       );
//     }, (error) {
//       state = state.copyWith(
//         isLoading: false,
//         errorMsg: error.message,
//       );
//     });
//   }

//   void deleteFromCart(int id) async {
//     state = state.copyWith(isLoading: true, errorMsg: null);

//     final service = ref.read(cartServiceProvider);
//     final result = await service.deleteFromCart(id);

//     result.when((success) {
//       final oldItems = state.cartItems.value ?? [];
//       state = state.copyWith(
//         isLoading: false,
//         cartTotal: success.formattedCartTotal,
//         badgeCount: success.badgeCount,
//         cartItems: AsyncData(
//           List.from(oldItems)..removeWhere((e) => e.id == id),
//         ),
//       );
//     }, (error) {
//       state = state.copyWith(
//         isLoading: false,
//         errorMsg: error.message,
//       );
//     });
//   }

//   Map<String, dynamic> _prepareUpdateItem(int id) {
//     double lineAmount = 0.0;
//     final oldItems = state.cartItems.value ?? [];
//     final product = oldItems.firstWhere((e) => e.id == id);

//     final discount = product.discount;
//     final discountedPrice = product.discountedPrice;
//     final price = product.price;
//     final qty = product.qty;

//     if (discount > 0.0) {
//       lineAmount = qty * discountedPrice;
//     } else {
//       lineAmount = qty * price;
//     }

//     final item = {
//       'id': id,
//       'qty': qty,
//       'price': price,
//       'discount': discount,
//       'discounted_price': discountedPrice,
//       'line_amount': lineAmount,
//     };

//     return item;
//   }

//   void incrementQty(int id) {
//     final oldItems = state.cartItems.value ?? [];
//     state = state.copyWith(
//       cartItems: AsyncData([
//         for (final item in oldItems)
//           if (item.id == id) item.copyWith(qty: item.qty + 1) else item
//       ]),
//     );
//   }

//   void decrementQty(int id) {
//     final oldItems = state.cartItems.value ?? [];
//     state = state.copyWith(
//       cartItems: AsyncData([
//         for (final item in oldItems)
//           if (item.id == id) item.copyWith(qty: item.qty - 1) else item
//       ]),
//     );
//   }
// }
