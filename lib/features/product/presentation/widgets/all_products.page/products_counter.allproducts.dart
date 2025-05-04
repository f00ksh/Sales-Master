import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_master/features/product/presentation/viewmodels/allProduct.viewmodel.dart';

class ProductCounter extends ConsumerWidget {
  const ProductCounter({
    super.key,
  });
  //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProductsProvider = ref.watch(allProductViewModelProvider);
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      elevation: 2,
      child: Container(
        height: 46.h,
        width: 80.w,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: allProductsProvider.when(
          data: (data) {
            return Center(
              child: Text(
                data.length.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            );
          },
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
