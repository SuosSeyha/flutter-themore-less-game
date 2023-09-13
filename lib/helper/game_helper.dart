import 'package:shared_preferences/shared_preferences.dart';
class GameHelper{
  static const  String keyTotalEarn='Balance1';
  static const  String keyRoute='GamePage1';
  // set preference
  static Future<void> setBalance(double totalEarn)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(keyTotalEarn, totalEarn);
  }
  static Future<void> setGamePage(bool route)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyRoute, route);
  }
  // get preference
  static Future<double?> getBalance()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(keyTotalEarn);
  }
  static Future<bool?> getGamePage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyRoute);
  }
}