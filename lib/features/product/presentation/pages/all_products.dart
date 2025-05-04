import 'package:flutter/material.dart';
import 'package:sales_master/features/product/presentation/pages/add_product.dart';
import 'package:sales_master/features/product/presentation/widgets/all_products.page/sliver_appbar.allproducts.dart';
import 'package:sales_master/features/product/presentation/widgets/all_products.page/sliver_grid.allproducts.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(.6),
          toolbarHeight: 0,
        ),
        body: const CustomScrollView(
          slivers: <Widget>[
            AllProductsSliverAppBar(),
            AllProductsSliverGrid(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddNewProductPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
