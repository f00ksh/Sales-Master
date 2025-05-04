import 'package:sales_master/features/product/data/models/product.model.dart';

abstract class IProductRepo {
  // gel all products
  Future<List<Product>> getAllProducts();
  // get product by id
  Future<Product> getProduct(int id);
  // add product
  Future<void> addProduct(Product product);
  // update product
  Future<void> updateProduct(Product product);
  // delete product
  Future<void> deleteProduct(int id);
  // search product
  Future<List<Product>> searchProduct(String searchText);
}
