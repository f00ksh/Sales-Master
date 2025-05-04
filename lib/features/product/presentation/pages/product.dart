import 'package:flutter/material.dart';
import 'package:sales_master/features/product/presentation/widgets/product.page/sliver_appbar.product.dart';
import 'package:sales_master/features/product/presentation/widgets/product.page/sliver_body.product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductSliverAppBar(id: id),
          ProductSliverBody(id: id),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.mode_edit_rounded),
      ),
    );
  }
}
