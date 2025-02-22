import 'package:freezed_annotation/freezed_annotation.dart';

part 'optional_item.freezed.dart';
part 'optional_item.g.dart';

///OptionalItem Model
@freezed
class OptionalItem with _$OptionalItem {
  /// Constructor of [OptionalItem]
  const factory OptionalItem({
    required String name,
    required double price,
    String? description,
  }) = _OptionalItem;
  const OptionalItem._();

  /// Convert json [Map] in a [OptionalItem]
  factory OptionalItem.fromJson(Map<String, dynamic> json) =>
      _$OptionalItemFromJson(json);
}
