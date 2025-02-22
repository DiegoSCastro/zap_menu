// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'optional_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OptionalItem _$OptionalItemFromJson(Map<String, dynamic> json) {
  return _OptionalItem.fromJson(json);
}

/// @nodoc
mixin _$OptionalItem {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this OptionalItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptionalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionalItemCopyWith<OptionalItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionalItemCopyWith<$Res> {
  factory $OptionalItemCopyWith(
          OptionalItem value, $Res Function(OptionalItem) then) =
      _$OptionalItemCopyWithImpl<$Res, OptionalItem>;
  @useResult
  $Res call({String name, double price, String? description});
}

/// @nodoc
class _$OptionalItemCopyWithImpl<$Res, $Val extends OptionalItem>
    implements $OptionalItemCopyWith<$Res> {
  _$OptionalItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionalItemImplCopyWith<$Res>
    implements $OptionalItemCopyWith<$Res> {
  factory _$$OptionalItemImplCopyWith(
          _$OptionalItemImpl value, $Res Function(_$OptionalItemImpl) then) =
      __$$OptionalItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double price, String? description});
}

/// @nodoc
class __$$OptionalItemImplCopyWithImpl<$Res>
    extends _$OptionalItemCopyWithImpl<$Res, _$OptionalItemImpl>
    implements _$$OptionalItemImplCopyWith<$Res> {
  __$$OptionalItemImplCopyWithImpl(
      _$OptionalItemImpl _value, $Res Function(_$OptionalItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptionalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_$OptionalItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionalItemImpl extends _OptionalItem {
  const _$OptionalItemImpl(
      {required this.name, required this.price, this.description})
      : super._();

  factory _$OptionalItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionalItemImplFromJson(json);

  @override
  final String name;
  @override
  final double price;
  @override
  final String? description;

  @override
  String toString() {
    return 'OptionalItem(name: $name, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionalItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, description);

  /// Create a copy of OptionalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionalItemImplCopyWith<_$OptionalItemImpl> get copyWith =>
      __$$OptionalItemImplCopyWithImpl<_$OptionalItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionalItemImplToJson(
      this,
    );
  }
}

abstract class _OptionalItem extends OptionalItem {
  const factory _OptionalItem(
      {required final String name,
      required final double price,
      final String? description}) = _$OptionalItemImpl;
  const _OptionalItem._() : super._();

  factory _OptionalItem.fromJson(Map<String, dynamic> json) =
      _$OptionalItemImpl.fromJson;

  @override
  String get name;
  @override
  double get price;
  @override
  String? get description;

  /// Create a copy of OptionalItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionalItemImplCopyWith<_$OptionalItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
