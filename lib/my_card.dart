import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'helpers.dart';

Uuid uuid = const Uuid();

class MyCard {
  final String id;
  final String title;
  final int color;
  final DateTime dateTime;

  MyCard({
    String? id,
    required this.title,
    required this.color,
    required this.dateTime,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory MyCard.fromMap(Map<String, dynamic> map) {
    return MyCard(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      color: map['color']?.toInt() ?? 0,
      dateTime:
          DateTime.tryParse(map['dateTime'] ?? '')?.toLocal() ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCard.fromJson(String source) =>
      MyCard.fromMap(jsonDecodeSafe(source) ?? <String, dynamic>{});

  @override
  String toString() =>
      'MyCard(id: $id, title: $title, color: ${color.toRadixString(16)}, dateTime: $dateTime)';
}
