import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:sales_master/features/cart/presentation/viewmodels/cart.viewmodel.dart';
import 'package:sales_master/features/cart/presentation/widgets/searchbar.dart';
import 'package:sales_master/features/cart/presentation/widgets/sliverlist.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  // calculate function
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(cartOrderProductListProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(.6),
            toolbarHeight: 0,
          ),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                sliver: SliverAppBar(
                  forceMaterialTransparency: true,
                  backgroundColor: Colors.transparent,
                  floating: true,
                  snap: true,
                  expandedHeight: 49.h,
                  automaticallyImplyLeading: false,
                  flexibleSpace: const SearchBarApp(),
                ),
              ),
              products.isEmpty
                  ? SliverToBoxAdapter(
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
                            illustration: UnDrawIllustration.empty,
                            placeholder: const Text("Cart is empty"),
                          ),
                        ),
                      ),
                    )
                  : const SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      sliver: SliverCartListProducts(),
                    ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {},
            icon: const Icon(Icons.done),
            label: const Center(
              child: Text('Confirm'),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endContained,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomAppBar(
              height: 90.h,
              child: const Row(
                children: [
                  Text(
                    '2200 \$',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

}
