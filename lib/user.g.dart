// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String?,
      json['title'] as String,
      json['color'] as int,
      DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'dateTime': instance.dateTime.toIso8601String(),
    };
