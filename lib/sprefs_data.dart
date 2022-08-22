import 'package:demo_share_preferences/my_card.dart';
import 'package:demo_share_preferences/sprefs.dart';

class SPrefData {
  static const cardKey = "card";
  static const cardListKey = "cardList";

  static Future<MyCard?> getCard() async {
    return MyCard.fromJson(await SPref.getString(cardKey) ?? "");
  }

  static Future<bool> setCard(MyCard card) async {
    return SPref.setString(cardKey, card.toJson());
  }

  static Future<bool> saveList(List<MyCard> cards) async {
    return SPref.setStringList(
        cardListKey, cards.map((card) => card.toJson()).toList());
  }

  static Future<List<MyCard>> getList() async {
    final List<String> jsonList = await SPref.getStringList(cardListKey) ?? [];
    return jsonList.map((json) => MyCard.fromJson(json)).toList();
  }

  static Future<bool> removeList() async {
    return SPref.removeString(cardListKey);
  }

  static Future<bool> removeCard() async {
    return SPref.removeString(cardKey);
  }

  static Future<bool> addCardToList(MyCard card) async {
    final List<MyCard> cards = await getList();
    cards.add(card);
    return saveList(cards);
  }

  static Future<bool> removeCardFromList(MyCard card) async {
    final List<MyCard> cards = await getList();

    final List<MyCard> newCards = cards.where((c) => c.id != card.id).toList();

    return saveList(newCards);
  }
}
