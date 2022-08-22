import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'card_model2.g.dart';

Uuid uuid = const Uuid();

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class CardModel2 {
  CardModel2({
    String? id,
    required this.title,
    required this.color,
    required this.dateTime,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final int color;
  final DateTime dateTime;

  factory CardModel2.fromJson(Map<String, dynamic> json) =>
      _$CardModel2FromJson(json);

  Map<String, dynamic> toJson() => _$CardModel2ToJson(this);
}
