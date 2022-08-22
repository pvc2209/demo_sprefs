// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel2 _$CardModel2FromJson(Map<String, dynamic> json) => CardModel2(
      id: json['id'] as String?,
      title: json['title'] as String,
      color: json['color'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$CardModel2ToJson(CardModel2 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'dateTime': instance.dateTime.toIso8601String(),
    };
