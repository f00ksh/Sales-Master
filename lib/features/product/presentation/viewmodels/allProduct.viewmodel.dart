import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/product/data/models/product.model.dart';
import 'package:sales_master/features/product/presentation/providers/product.provider.dart';

part 'allProduct.viewmodel.g.dart';

// View model for managing all products
@riverpod
class AllProductViewModel extends _$AllProductViewModel {
  @override
  FutureOr<List<Product>> build() async {
    return _getAllProducts();
  }

  // add new product
  Future<void> addNewProduct(Product product) async {
    await ref.watch(productsRepositoryProvider).addProduct(product);
    ref.invalidateSelf();
  }

  // get all products
  Future<List<Product>> _getAllProducts() async {
    final allProduct =
        await ref.watch(productsRepositoryProvider).getAllProducts();
    return allProduct;
  }

  // update product
  Future<void> updateProduct(Product product) async {
    await ref.watch(productsRepositoryProvider).updateProduct(product);
  }

  // delete product
  Future<void> deleteProduct(int id) async {
    await ref.watch(productsRepositoryProvider).deleteProduct(id);
    ref.invalidateSelf();
  }

  // search product
  Future<List<Product>> searchProduct(String searchText) async {
    final allProduct =
        ref.watch(productsRepositoryProvider).searchProduct(searchText);
    return allProduct;
  }
}

// View model for a single product
@riverpod
class ProductViewModel extends _$ProductViewModel {
  @override
  FutureOr<Product> build(int id) async {
    return _getProduct(id);
  }

  Future<Product> _getProduct(int id) async {
    final product = await ref.watch(productsRepositoryProvider).getProduct(id);
    return product;
  }
}

// View model for searching products
@riverpod
class ProductSearch extends _$ProductSearch {
  @override
  FutureOr<List<Product>> build(String searchText) {
    final products =
        ref.watch(productsRepositoryProvider).searchProduct(searchText);

    return products;
  }
}
