import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:sales_master/features/product/data/models/product.model.dart';
import 'package:sales_master/features/product/data/repositories/iproduct.dart';
import 'package:sales_master/shared/providers/shared_providers.dart';

class ProductRepository implements IProductRepo {
  final Ref ref;

  ProductRepository(this.ref);
  @override
  Future<List<Product>> getAllProducts() async {
    final isar = await ref.read(isaeDbProvider.future);
    final products = isar.products.where().findAll();
    return products;
  }

  @override
  Future<Product> getProduct(int id) async {
    final isar = await ref.read(isaeDbProvider.future);
    final product = isar.products.getSync(id);
    return product!;
  }

  @override
  Future<void> addProduct(Product product) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxnSync(() {
      return isar.products.putSync(product);
    });
  }

  @override
  Future<void> updateProduct(Product product) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxnSync(() {
      isar.products.putSync(product);
    });
  }

  @override
  Future<void> deleteProduct(int id) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxn(() async {
      isar.products.delete(id);
    });
  }

  @override
  Future<List<Product>> searchProduct(String searchText) async {
    final isar = await ref.read(isaeDbProvider.future);
    final products = isar.products.filter().nameContains(searchText).findAll();

    return products;
  }
}
