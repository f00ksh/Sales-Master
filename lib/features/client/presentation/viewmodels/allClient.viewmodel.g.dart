// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allClient.viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allClientViewModelHash() =>
    r'67b746418f0aba45c9ba53e88359173fe4766b4e';

/// See also [AllClientViewModel].
@ProviderFor(AllClientViewModel)
final allClientViewModelProvider =
    AutoDisposeAsyncNotifierProvider<AllClientViewModel, List<Client>>.internal(
  AllClientViewModel.new,
  name: r'allClientViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allClientViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllClientViewModel = AutoDisposeAsyncNotifier<List<Client>>;
String _$clientViewModelHash() => r'c39717d58e9deab985529daae86db7ec26e83fc4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ClientViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Client> {
  late final int id;

  FutureOr<Client> build(
    int id,
  );
}

/// See also [ClientViewModel].
@ProviderFor(ClientViewModel)
const clientViewModelProvider = ClientViewModelFamily();

/// See also [ClientViewModel].
class ClientViewModelFamily extends Family<AsyncValue<Client>> {
  /// See also [ClientViewModel].
  const ClientViewModelFamily();

  /// See also [ClientViewModel].
  ClientViewModelProvider call(
    int id,
  ) {
    return ClientViewModelProvider(
      id,
    );
  }

  @override
  ClientViewModelProvider getProviderOverride(
    covariant ClientViewModelProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clientViewModelProvider';
}

/// See also [ClientViewModel].
class ClientViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ClientViewModel, Client> {
  /// See also [ClientViewModel].
  ClientViewModelProvider(
    int id,
  ) : this._internal(
          () => ClientViewModel()..id = id,
          from: clientViewModelProvider,
          name: r'clientViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clientViewModelHash,
          dependencies: ClientViewModelFamily._dependencies,
          allTransitiveDependencies:
              ClientViewModelFamily._allTransitiveDependencies,
          id: id,
        );

  ClientViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Client> runNotifierBuild(
    covariant ClientViewModel notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ClientViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClientViewModelProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ClientViewModel, Client>
      createElement() {
    return _ClientViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClientViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClientViewModelRef on AutoDisposeAsyncNotifierProviderRef<Client> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ClientViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ClientViewModel, Client>
    with ClientViewModelRef {
  _ClientViewModelProviderElement(super.provider);

  @override
  int get id => (origin as ClientViewModelProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
