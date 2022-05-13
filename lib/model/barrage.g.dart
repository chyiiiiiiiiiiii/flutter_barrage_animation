// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barrage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barrage _$BarrageFromJson(Map<String, dynamic> json) => Barrage()
  ..imgUrl = json['img_url'] as String? ?? ''
  ..text = json['text'] as String? ?? '';

Map<String, dynamic> _$BarrageToJson(Barrage instance) => <String, dynamic>{
      'img_url': instance.imgUrl,
      'text': instance.text,
    };
