import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/client/data/models/client.model.dart';
import 'package:sales_master/features/client/presentation/providers/client.provider.dart';

part 'allClient.viewmodel.g.dart';

@riverpod
class AllClientViewModel extends _$AllClientViewModel {
  @override
  FutureOr<List<Client>> build() async {
    return _getAllClients();
  }

  // add new product
  Future<void> addNewClient(Client client) async {
    await ref.watch(clientsRepositoryProvider).addClient(client);
    ref.invalidateSelf();
  }

  // get all products
  Future<List<Client>> _getAllClients() async {
    final allClients =
        await ref.watch(clientsRepositoryProvider).getAllClients();
    return allClients;
  }

  // update Client
  Future<void> updateClient(Client client) async {
    await ref.watch(clientsRepositoryProvider).updateClient(client);
  }

  // delete Client
  Future<void> deleteClient(int id) async {
    await ref.watch(clientsRepositoryProvider).deleteClient(id);
    ref.invalidateSelf();
  }
}

@riverpod
class ClientViewModel extends _$ClientViewModel {
  @override
  FutureOr<Client> build(int id) async {
    return _getClient(id);
  }

  Future<Client> _getClient(int id) async {
    final client = await ref.watch(clientsRepositoryProvider).getClient(id);
    return client;
  }
}
