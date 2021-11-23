// ignore: file_names
import 'dart:convert';

import 'package:feel_music_final/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Future<String?> getToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");

  }
  Future <bool>setToken(String token)async{
    try{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
  Future <bool>delToken()async{
    try{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.remove("token");
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}
class GlobalUser{
  // User user=new User();
  static read() async {
    // User user = User.fromJson(await sharedPref.read("user"));
    final prefs = await SharedPreferences.getInstance();
    final user2=User.fromJson(jsonDecode(prefs.getString("user")??""));
    return user2;
  }

  static  save(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(user));
    // print("generated Json $prefs");
  }

  static remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }
}