import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_master/features/cart/presentation/providers/cart_page.provider.dart';
import 'package:sales_master/features/cart/presentation/viewmodels/cart.viewmodel.dart';
import 'package:sales_master/features/order/data/models/order.model.dart';
import 'package:sales_master/features/product/data/models/product.model.dart';
import 'package:sales_master/features/product/presentation/viewmodels/allProduct.viewmodel.dart';

class SearchBarApp extends ConsumerStatefulWidget {
  const SearchBarApp({super.key});

  @override
  ConsumerState<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends ConsumerState<SearchBarApp> {
  final dialogController = TextEditingController();
  Iterable<Widget> getSuggestions(
    SearchController controller,
    List<Product> products,
  ) {
    final String input = controller.value.text;
    return products
        .where((Product product) => product.name!.contains(input))
        .map(
          (Product product) => ListTile(
            leading: CircleAvatar(
              backgroundImage: product.imagePath!.isNotEmpty
                  ? FileImage(
                      File(product.imagePath!),
                    )
                  : null,
            ),
            title: Text(product.name ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                controller.text = product.name ?? '';
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
                addProductDialog(
                  product,
                  controller,
                );
              },
            ),
            onTap: () async {
              controller.text = product.name ?? '';
              controller.selection =
                  TextSelection.collapsed(offset: controller.text.length);
              addProductDialog(
                product,
                controller,
              );
            },
          ),
        );
  }

  Future<void> addProductDialog(
    Product product,
    SearchController controller,
  ) {
    final avilableInStore = product.count.toString();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          // Initial quantity value
          int quantity = ref.watch(quantityProvider);
          dialogController.text = quantity.toString();
          return AlertDialog(
            title: Text(product.name ?? ''),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: Text('Avilable : $avilableInStore'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.small(
                      elevation: 1,
                      onPressed: () {
                        ref.read(quantityProvider.notifier).state--;
                        setState(() {});
                      },
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 70.w,
                      child: TextField(
                        controller: dialogController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          ref.read(quantityProvider.notifier).state =
                              int.parse(value);
                        },
                      ),
                    ),
                    FloatingActionButton.small(
                      elevation: 1,
                      onPressed: () {
                        ref.read(quantityProvider.notifier).state++;
                        setState(() {});
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              OutlinedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  ref.read(quantityProvider.notifier).state = 1;
                  Navigator.of(context).pop();
                },
              ),
              FilledButton(
                child: const Text('Add'),
                onPressed: () async {
                  final newProduct = OrderProduct(
                    productId: product.id,
                    price: product.price,
                    quantity: ref.watch(quantityProvider),
                    productName: product.name,
                    publicPrice: product.publicPrice,
                    imagePath: product.imagePath,
                  );

                  ref.read(cartOrderProductListProvider.notifier).addProduct(
                        newProduct,
                        quantity,
                      );
                  ref.invalidate(cartListProvider);
                  ref.read(quantityProvider.notifier).state = 1;
                  controller.closeView(product.name);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Consumer(
          builder: (context, ref, child) {
            final allProducts = ref.watch(allProductViewModelProvider);

            return allProducts.when(
              loading: () => const MaterialSearchBar(),
              error: (error, stackTrace) => const MaterialSearchBar(),
              data: (products) {
                return SearchAnchor(
                  isFullScreen: false,
                  builder: (context, controller) {
                    return MaterialSearchBar(controller: controller);
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    if (controller.text.isEmpty) {
                      return <Widget>[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('No search history.'),
                          ),
                        ),
                      ];
                    }
                    return getSuggestions(controller, products);
                  },
                  viewConstraints: BoxConstraints(maxHeight: 320.h),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class MaterialSearchBar extends StatelessWidget {
  const MaterialSearchBar({
    super.key,
    this.controller,
  });
  final SearchController? controller;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTap: () {
        if (controller != null) {
          controller!.openView();
        }
      },
      controller: controller,
      hintText: 'Add Product ...',
      constraints: BoxConstraints.tight(const Size(double.infinity, 50)),
      elevation: const MaterialStatePropertyAll(3),
      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 9.w),
      ),
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}
