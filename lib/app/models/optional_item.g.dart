// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optional_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionalItemImpl _$$OptionalItemImplFromJson(Map<String, dynamic> json) =>
    _$OptionalItemImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$OptionalItemImplToJson(_$OptionalItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
