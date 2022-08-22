import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'helpers.dart';

Uuid uuid = const Uuid();

class CardModel {
  final String id;
  final String title;
  final int color;
  final DateTime dateTime;

  CardModel({
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

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      color: map['color']?.toInt() ?? 0,
      dateTime:
          DateTime.tryParse(map['dateTime'] ?? '')?.toLocal() ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(jsonDecodeSafe(source) ?? <String, dynamic>{});

  @override
  String toString() =>
      'MyCard(id: $id, title: $title, color: ${color.toRadixString(16)}, dateTime: $dateTime)';
}
