import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_master/features/product/presentation/providers/product.provider.dart';

class AllProductsSliverAppBar extends ConsumerWidget {
  const AllProductsSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      sliver: SliverAppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        floating: true,
        snap: true,
        expandedHeight: 49.h,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SearchBar(
              onChanged: (value) {
                ref.read(productSearchTextProvider.notifier).update(value);
              },
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
              constraints:
                  BoxConstraints.tight(const Size(double.infinity, 50)),
              hintText: 'Search for products...',
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
            ),
          ],
        ),
      ),
    );
  }
}


//