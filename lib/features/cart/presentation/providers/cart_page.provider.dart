import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/cart/presentation/viewmodels/cart.viewmodel.dart';
import 'package:sales_master/features/order/data/models/order.model.dart';
part 'cart_page.provider.g.dart';

@riverpod
FutureOr<List<OrderProduct>> cartList(CartListRef ref) {
  final products = ref.watch(cartOrderProductListProvider);
  return products;
}

final quantityProvider = StateProvider<int>((ref) => 1);
