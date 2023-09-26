import 'package:shared_preferences/shared_preferences.dart';

saveInt({required String key, required int value}) async {
  final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
  await prefs.setInt(key, value);
}

Future<int?> getIntValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  int? intValue = prefs.getInt(key);
  return intValue;
}

saveBool({required String key, required bool value}) async {
  final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
  await prefs.setBool(key, value);
}

Future<bool> getBoolValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  bool boolValue = prefs.getBool(key) ?? false;
  return boolValue;
}

clearStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
