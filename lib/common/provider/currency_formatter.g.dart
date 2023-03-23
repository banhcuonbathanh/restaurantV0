// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_formatter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$currencyFormatterHash() => r'170cc60063b12417368a747d76c8b866e72880b0';

/// See also [currencyFormatter].
class CurrencyFormatterProvider extends AutoDisposeProvider<NumberFormat> {
  CurrencyFormatterProvider(
    this.name,
  ) : super(
          (ref) => currencyFormatter(
            ref,
            name,
          ),
          from: currencyFormatterProvider,
          name: r'currencyFormatterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currencyFormatterHash,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is CurrencyFormatterProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CurrencyFormatterRef = AutoDisposeProviderRef<NumberFormat>;

/// See also [currencyFormatter].
final currencyFormatterProvider = CurrencyFormatterFamily();

class CurrencyFormatterFamily extends Family<NumberFormat> {
  CurrencyFormatterFamily();

  CurrencyFormatterProvider call(
    String name,
  ) {
    return CurrencyFormatterProvider(
      name,
    );
  }

  @override
  AutoDisposeProvider<NumberFormat> getProviderOverride(
    covariant CurrencyFormatterProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'currencyFormatterProvider';
}
