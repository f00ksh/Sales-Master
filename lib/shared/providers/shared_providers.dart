import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_master/features/client/data/models/client.model.dart';
import 'package:sales_master/features/product/data/models/product.model.dart';

final isaeDbProvider = FutureProvider<Isar>(
  (ref) async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [ProductSchema, ClientSchema],
      directory: dir.path,
    );

    return isar;
  },
);
