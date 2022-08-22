import 'dart:convert';

jsonDecodeSafe(String json) {
  try {
    return jsonDecode(json);
  } catch (e) {
    return null;
  }
}
