import 'package:sales_master/features/product/data/models/product.model.dart';
import 'package:sales_master/features/product/data/repositories/iproduct.dart';

class MocProductRepository implements IProductRepo {
  final List<Product> _products = [
    Product()
      ..name = 'mohamed'
      ..count = 10
      ..price = 100
      ..intialCount = 10
      ..publicPrice = 120
      ..colorId = 1
      ..unitType = 'spray'
  ];
  @override
  Future<List<Product>> getAllProducts() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return _products;
      },
    );
  }

  @override
  Future<Product> getProduct(int id) {
    return Future.delayed(const Duration(seconds: 1), () {
      return _products[id];
    });
  }

  @override
  Future<void> addProduct(Product product) {
    return Future.delayed(const Duration(seconds: 1), () {
      _products.add(product);
    });
  }

  @override
  Future<void> updateProduct(Product product) {
    return Future.delayed(const Duration(seconds: 1), () {
      _products[_products.indexOf(product)] = product;
    });
  }

  @override
  Future<void> deleteProduct(int id) {
    return Future.delayed(const Duration(seconds: 1), () {
      _products.removeAt(id);
    });
  }

  @override
  Future<List<Product>> searchProduct(String searchText) {
    throw UnimplementedError();
  }
}
