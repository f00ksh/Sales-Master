import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/order/data/models/order.model.dart';
part 'cart.viewmodel.g.dart';

@Riverpod(keepAlive: true)
class CartOrderProductList extends _$CartOrderProductList {
  @override
  List<OrderProduct> build() {
    return [];
  }

  // reset state
  void reset() {
    state = [];
  }

  double totalPrice() {
    double total = 0;
    for (var product in state) {
      total += (product.price ?? 0) * (product.quantity ?? 0);
    }
    return total;
  }

  double publicTotalPrice() {
    double publicTotal = 0;
    for (var product in state) {
      publicTotal += (product.price ?? 0) * (product.quantity ?? 0);
    }
    return publicTotal;
  }

  void addProduct(OrderProduct product, int? quantity) {
    if (quantity != 0) {
      bool isExist = state
          .any((existProduct) => existProduct.productId == product.productId);
      if (!isExist) {
        state.add(product);
      } else {
        // update the old product
        state = state
            .map(
              (product) => product.productId == product.productId
                  ? product.copyWith(quantity: quantity!)
                  : product,
            )
            .toList();
      }
    } else {
      removeProduct(product.productId!);
    }
    ref.notifyListeners();
  }

  void removeProduct(int productId) {
    state = state
        .where(
          (product) => product.productId != productId,
        )
        .toList();
  }
}
