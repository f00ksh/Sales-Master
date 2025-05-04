import 'package:isar/isar.dart';

part 'client.model.g.dart';

@collection
class Client {
  Id id = Isar.autoIncrement;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? clientNote;
  double? balance;
  int? colorID;
}
