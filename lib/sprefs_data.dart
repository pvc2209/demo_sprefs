import 'dart:convert';

import 'package:demo_share_preferences/card_model2.dart';
import 'package:demo_share_preferences/helpers.dart';
import 'package:demo_share_preferences/sprefs.dart';

class SPrefData {
  static const cardKey = "card";
  static const cardListKey = "cardList";

  static Future<CardModel2?> getCard() async {
    return CardModel2.fromJson(
      jsonDecodeSafe(await SPref.getString(cardKey) ?? "") ??
          <String, dynamic>{},
    );
  }

  static Future<bool> setCard(CardModel2 card) async {
    return SPref.setString(cardKey, json.encode(card.toJson()));
  }

  static Future<bool> saveList(List<CardModel2> cards) async {
    return SPref.setStringList(
        cardListKey, cards.map((card) => json.encode(card.toJson())).toList());
  }

  static Future<List<CardModel2>> getList() async {
    final List<String> jsonList = await SPref.getStringList(cardListKey) ?? [];
    return jsonList
        .map((json) =>
            CardModel2.fromJson(jsonDecodeSafe(json) ?? <String, dynamic>{}))
        .toList();
  }

  static Future<bool> removeList() async {
    return SPref.removeString(cardListKey);
  }

  static Future<bool> removeCard() async {
    return SPref.removeString(cardKey);
  }

  static Future<bool> addCardToList(CardModel2 card) async {
    final List<CardModel2> cards = await getList();
    cards.add(card);
    return saveList(cards);
  }

  static Future<bool> removeCardFromList(CardModel2 card) async {
    final List<CardModel2> cards = await getList();

    final List<CardModel2> newCards =
        cards.where((c) => c.id != card.id).toList();

    return saveList(newCards);
  }
}
