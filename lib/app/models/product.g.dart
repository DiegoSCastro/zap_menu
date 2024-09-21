// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sideDishes: json['sideDishes'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'sideDishes': instance.sideDishes,
      'imagePath': instance.imagePath,
      'price': instance.price,
    };
