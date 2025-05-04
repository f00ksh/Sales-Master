// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_master/features/cart/presentation/providers/cart_page.provider.dart';
import 'package:sales_master/features/cart/presentation/viewmodels/cart.viewmodel.dart';
import 'package:sales_master/shared/widgets/custom_list_tile.dart';

class SliverCartListProducts extends ConsumerWidget {
  const SliverCartListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(cartListProvider);
    return productList.when(
      data: (products) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: products.length,
            (context, index) {
              final product = products[index];
              return Dismissible(
                onDismissed: (direction) => ref
                    .read(cartOrderProductListProvider.notifier)
                    .removeProduct(product.productId!),
                key: Key(product.productId.toString()),
                child: CustomListItem(
                  thumbnail: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        image: DecorationImage(
                          filterQuality: FilterQuality.none,
                          fit: BoxFit.fill,
                          image: FileImage(
                            File(product.imagePath!),
                          ),
                        )),
                  ),
                  productName: product.productName ?? '',
                  productPrice: product.price.toString(),
                  productPublicPrice: product.publicPrice.toString(),
                  productQuantity: product.quantity.toString(),
                  totalPrice: (product.price! * (product.quantity)!).toString(),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return const SliverToBoxAdapter(
            child: Center(
          child: Text('Something went wrong'),
        ));
      },
      loading: () {
        return const SliverToBoxAdapter(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
