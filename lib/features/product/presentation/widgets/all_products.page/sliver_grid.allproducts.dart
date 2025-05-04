import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:sales_master/features/product/presentation/pages/product.dart';
import 'package:sales_master/features/product/presentation/providers/product.provider.dart';
import 'package:sales_master/features/product/presentation/viewmodels/allProduct.viewmodel.dart';

class AllProductsSliverGrid extends ConsumerWidget {
  const AllProductsSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(productSearchTextProvider);
    final allProductsProvider = searchText.isEmpty
        ? ref.watch(allProductViewModelProvider)
        : ref.watch(productSearchProvider(searchText));

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      sliver: allProductsProvider.when(
        data: (products) {
          return products.isNotEmpty
              ? SliverGrid.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          final id = product.id.toString();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductPage(id: id),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    image: product.imagePath!.isEmpty
                                        ? null
                                        : DecorationImage(
                                            filterQuality: FilterQuality.none,
                                            fit: BoxFit.fill,
                                            image: FileImage(
                                              File(product.imagePath!),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '${product.name}',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 13.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 150.h,
                      horizontal: 50.w,
                    ),
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: UnDraw(
                        color: Theme.of(context).colorScheme.primary,
                        illustration: UnDrawIllustration.ride_a_bicycle,
                        placeholder: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                );
        },
        error: (error, stackTrace) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Something went wrong'),
            ),
          );
        },
        loading: () {
          return SliverToBoxAdapter(
            child: Center(
              heightFactor: 10.h,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
