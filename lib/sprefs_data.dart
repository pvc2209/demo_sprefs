import 'package:demo_share_preferences/card_model.dart';
import 'package:demo_share_preferences/sprefs.dart';

class SPrefData {
  static const cardKey = "card";
  static const cardListKey = "cardList";

  static Future<CardModel?> getCard() async {
    return CardModel.fromJson(await SPref.getString(cardKey) ?? "");
  }

  static Future<bool> setCard(CardModel card) async {
    return SPref.setString(cardKey, card.toJson());
  }

  static Future<bool> saveList(List<CardModel> cards) async {
    return SPref.setStringList(
        cardListKey, cards.map((card) => card.toJson()).toList());
  }

  static Future<List<CardModel>> getList() async {
    final List<String> jsonList = await SPref.getStringList(cardListKey) ?? [];
    return jsonList.map((json) => CardModel.fromJson(json)).toList();
  }

  static Future<bool> removeList() async {
    return SPref.removeString(cardListKey);
  }

  static Future<bool> removeCard() async {
    return SPref.removeString(cardKey);
  }

  static Future<bool> addCardToList(CardModel card) async {
    final List<CardModel> cards = await getList();
    cards.add(card);
    return saveList(cards);
  }

  static Future<bool> removeCardFromList(CardModel card) async {
    final List<CardModel> cards = await getList();

    final List<CardModel> newCards =
        cards.where((c) => c.id != card.id).toList();

    return saveList(newCards);
  }
}
