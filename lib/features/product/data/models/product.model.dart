import 'package:isar/isar.dart';

part 'product.model.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;
  String? name;
  double? price;
  double? publicPrice;
  int? intialCount;
  int? count;
  String? unitType;
  int? colorId;
  String? imagePath;
  String? productNote;
}
