// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: json['product'] == null
          ? const Product()
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      notes: json['notes'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'notes': instance.notes,
      'quantity': instance.quantity,
    };
