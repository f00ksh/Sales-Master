import 'package:sales_master/features/client/data/models/client.model.dart';

abstract class IClientRepository {
  // gel all Clients
  Future<List<Client>> getAllClients();
  // get Client by id
  Future<Client> getClient(int id);
  // add Client
  Future<void> addClient(Client client);
  // update Client
  Future<void> updateClient(Client client);
  // delete Client
  Future<void> deleteClient(int id);
}
