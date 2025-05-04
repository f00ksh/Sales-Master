// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsRepositoryHash() =>
    r'95e3317262be18812a775629013022dae8e4538e';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider = AutoDisposeProvider<IProductRepo>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRepositoryRef = AutoDisposeProviderRef<IProductRepo>;
String _$pickImageHash() => r'b3d9c800704f18bc39711ebbf11b3050eba204d6';

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

/// See also [pickImage].
@ProviderFor(pickImage)
const pickImageProvider = PickImageFamily();

/// See also [pickImage].
class PickImageFamily extends Family<AsyncValue<String>> {
  /// See also [pickImage].
  const PickImageFamily();

  /// See also [pickImage].
  PickImageProvider call(
    ImageSource source,
  ) {
    return PickImageProvider(
      source,
    );
  }

  @override
  PickImageProvider getProviderOverride(
    covariant PickImageProvider provider,
  ) {
    return call(
      provider.source,
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
  String? get name => r'pickImageProvider';
}

/// See also [pickImage].
class PickImageProvider extends AutoDisposeFutureProvider<String> {
  /// See also [pickImage].
  PickImageProvider(
    ImageSource source,
  ) : this._internal(
          (ref) => pickImage(
            ref as PickImageRef,
            source,
          ),
          from: pickImageProvider,
          name: r'pickImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pickImageHash,
          dependencies: PickImageFamily._dependencies,
          allTransitiveDependencies: PickImageFamily._allTransitiveDependencies,
          source: source,
        );

  PickImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
  }) : super.internal();

  final ImageSource source;

  @override
  Override overrideWith(
    FutureOr<String> Function(PickImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PickImageProvider._internal(
        (ref) => create(ref as PickImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _PickImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PickImageProvider && other.source == source;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PickImageRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `source` of this provider.
  ImageSource get source;
}

class _PickImageProviderElement extends AutoDisposeFutureProviderElement<String>
    with PickImageRef {
  _PickImageProviderElement(super.provider);

  @override
  ImageSource get source => (origin as PickImageProvider).source;
}

String _$imagPathHash() => r'b6cca05deaf91627361ab0412fd52c5e2d226a1f';

/// See also [imagPath].
@ProviderFor(imagPath)
final imagPathProvider = AutoDisposeProvider<String>.internal(
  imagPath,
  name: r'imagPathProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$imagPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImagPathRef = AutoDisposeProviderRef<String>;
String _$productSearchTextHash() => r'88334b796c77b807a90a38922a18686995420534';

/// See also [ProductSearchText].
@ProviderFor(ProductSearchText)
final productSearchTextProvider =
    AutoDisposeNotifierProvider<ProductSearchText, String>.internal(
  ProductSearchText.new,
  name: r'productSearchTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productSearchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductSearchText = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
