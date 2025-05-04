// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'order.model.g.dart';

@collection
class Order {
  Id id = Isar.autoIncrement;
  String? clientName;
  double? totalPrice;
  List<OrderProduct>? products;
  DateTime? confirmTime;
}

@embedded
class OrderProduct {
  int? productId;
  String? productName;
  int? quantity;
  double? price;
  double? publicPrice;
  String? imagePath;
  OrderProduct({
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.publicPrice,
    this.imagePath,
  });

  OrderProduct copyWith({
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    double? publicPrice,
    String? imagePath,
  }) {
    return OrderProduct()
      ..productId = productId ?? this.productId
      ..productName = productName ?? this.productName
      ..quantity = quantity ?? this.quantity
      ..price = price ?? this.price
      ..publicPrice = publicPrice ?? this.publicPrice
      ..imagePath = imagePath ?? this.imagePath;
  }
}
