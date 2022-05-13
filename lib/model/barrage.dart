import 'package:json_annotation/json_annotation.dart';

part 'barrage.g.dart';

/// Some data for animation displaying
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, explicitToJson: true)
class Barrage {
  Barrage();

  @JsonKey(defaultValue: '')
  String imgUrl = '';
  @JsonKey(defaultValue: '')
  String text = '';

  factory Barrage.fromJson(Map<String, dynamic> json) => _$BarrageFromJson(json);
  Map<String, dynamic> toJson() => _$BarrageToJson(this);
}
