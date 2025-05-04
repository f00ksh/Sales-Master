import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sales_master/features/client/data/repositories/client.repository.dart';
import 'package:sales_master/features/client/data/repositories/iclient.repository.dart';

part 'client.provider.g.dart';

@riverpod
IClientRepository clientsRepository(ClientsRepositoryRef ref) {
  return ClientRepository(ref);
}
