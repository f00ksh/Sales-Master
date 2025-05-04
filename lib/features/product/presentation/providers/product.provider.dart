import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_master/features/product/data/repositories/iproduct.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/product/data/repositories/product.repository.dart';

part 'product.provider.g.dart';

// Provider for the Product Repository
@riverpod
IProductRepo productsRepository(ProductsRepositoryRef ref) {
  return ProductRepository(ref);
}

// Provider for picking an image
@riverpod
Future<String> pickImage(PickImageRef ref, ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(
    imageQuality: 25,
    source: ImageSource.values[source.index],
  );

  if (pickedFile == null) {
    return '';
  }

  final appDirectory = await getApplicationDocumentsDirectory();

  final imagePath =
      '${appDirectory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';

  final File imageFile = File(pickedFile.path);

  await imageFile.copy(imagePath);

  return imagePath;
}

// Provider for an image path
@riverpod
String imagPath(ImagPathRef ref) {
  return '';
}

// Provider for Product Search Text
@riverpod
class ProductSearchText extends _$ProductSearchText {
  @override
  String build() {
    return '';
  }

  void update(String text) {
    state = text;
  }
}
