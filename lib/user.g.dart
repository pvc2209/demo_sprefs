// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel2 _$UserFromJson(Map<String, dynamic> json) => CardModel2(
      json['id'] as String?,
      json['title'] as String,
      json['color'] as int,
      DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$UserToJson(CardModel2 instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'dateTime': instance.dateTime.toIso8601String(),
    };
