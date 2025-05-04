import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:sales_master/features/client/data/models/client.model.dart';
import 'package:sales_master/features/client/data/repositories/iclient.repository.dart';
import 'package:sales_master/shared/providers/shared_providers.dart';

class ClientRepository implements IClientRepository {
  final Ref ref;

  ClientRepository(this.ref);
  @override
  Future<List<Client>> getAllClients() async {
    final isar = await ref.read(isaeDbProvider.future);
    final clients = isar.clients.where().findAll();
    return clients;
  }

  @override
  Future<Client> getClient(int id) async {
    final isar = await ref.read(isaeDbProvider.future);
    final client = isar.clients.getSync(id);
    return client!;
  }

  @override
  Future<void> addClient(Client client) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxnSync(() {
      return isar.clients.putSync(client);
    });
  }

  @override
  Future<void> updateClient(Client client) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxnSync(() {
      isar.clients.putSync(client);
    });
  }

  @override
  Future<void> deleteClient(int id) async {
    final isar = await ref.read(isaeDbProvider.future);
    isar.writeTxn(() async {
      isar.clients.delete(id);
    });
  }
}
