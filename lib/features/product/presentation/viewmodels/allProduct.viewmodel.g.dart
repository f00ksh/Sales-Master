// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allProduct.viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProductViewModelHash() =>
    r'3dcb4fb740f0bd885fd391e7beadceef9c5e148a';

/// See also [AllProductViewModel].
@ProviderFor(AllProductViewModel)
final allProductViewModelProvider = AutoDisposeAsyncNotifierProvider<
    AllProductViewModel, List<Product>>.internal(
  AllProductViewModel.new,
  name: r'allProductViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allProductViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllProductViewModel = AutoDisposeAsyncNotifier<List<Product>>;
String _$productViewModelHash() => r'70efe8ebc617d4037ee5564c212eae19ffe84f40';

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

abstract class _$ProductViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final int id;

  FutureOr<Product> build(
    int id,
  );
}

/// See also [ProductViewModel].
@ProviderFor(ProductViewModel)
const productViewModelProvider = ProductViewModelFamily();

/// See also [ProductViewModel].
class ProductViewModelFamily extends Family<AsyncValue<Product>> {
  /// See also [ProductViewModel].
  const ProductViewModelFamily();

  /// See also [ProductViewModel].
  ProductViewModelProvider call(
    int id,
  ) {
    return ProductViewModelProvider(
      id,
    );
  }

  @override
  ProductViewModelProvider getProviderOverride(
    covariant ProductViewModelProvider provider,
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
  String? get name => r'productViewModelProvider';
}

/// See also [ProductViewModel].
class ProductViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductViewModel, Product> {
  /// See also [ProductViewModel].
  ProductViewModelProvider(
    int id,
  ) : this._internal(
          () => ProductViewModel()..id = id,
          from: productViewModelProvider,
          name: r'productViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productViewModelHash,
          dependencies: ProductViewModelFamily._dependencies,
          allTransitiveDependencies:
              ProductViewModelFamily._allTransitiveDependencies,
          id: id,
        );

  ProductViewModelProvider._internal(
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
  FutureOr<Product> runNotifierBuild(
    covariant ProductViewModel notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ProductViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductViewModel, Product>
      createElement() {
    return _ProductViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductViewModelRef on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductViewModel, Product>
    with ProductViewModelRef {
  _ProductViewModelProviderElement(super.provider);

  @override
  int get id => (origin as ProductViewModelProvider).id;
}

String _$productSearchHash() => r'78435db888620dfac57ee26941178a9061522163';

abstract class _$ProductSearch
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String searchText;

  FutureOr<List<Product>> build(
    String searchText,
  );
}

/// See also [ProductSearch].
@ProviderFor(ProductSearch)
const productSearchProvider = ProductSearchFamily();

/// See also [ProductSearch].
class ProductSearchFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [ProductSearch].
  const ProductSearchFamily();

  /// See also [ProductSearch].
  ProductSearchProvider call(
    String searchText,
  ) {
    return ProductSearchProvider(
      searchText,
    );
  }

  @override
  ProductSearchProvider getProviderOverride(
    covariant ProductSearchProvider provider,
  ) {
    return call(
      provider.searchText,
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
  String? get name => r'productSearchProvider';
}

/// See also [ProductSearch].
class ProductSearchProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductSearch, List<Product>> {
  /// See also [ProductSearch].
  ProductSearchProvider(
    String searchText,
  ) : this._internal(
          () => ProductSearch()..searchText = searchText,
          from: productSearchProvider,
          name: r'productSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productSearchHash,
          dependencies: ProductSearchFamily._dependencies,
          allTransitiveDependencies:
              ProductSearchFamily._allTransitiveDependencies,
          searchText: searchText,
        );

  ProductSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchText,
  }) : super.internal();

  final String searchText;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant ProductSearch notifier,
  ) {
    return notifier.build(
      searchText,
    );
  }

  @override
  Override overrideWith(ProductSearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductSearchProvider._internal(
        () => create()..searchText = searchText,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchText: searchText,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductSearch, List<Product>>
      createElement() {
    return _ProductSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductSearchProvider && other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductSearchRef on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `searchText` of this provider.
  String get searchText;
}

class _ProductSearchProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductSearch,
        List<Product>> with ProductSearchRef {
  _ProductSearchProviderElement(super.provider);

  @override
  String get searchText => (origin as ProductSearchProvider).searchText;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
