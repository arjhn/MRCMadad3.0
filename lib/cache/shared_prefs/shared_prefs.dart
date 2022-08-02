import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

  late Future<SharedPreferences> _sharedPreferences;

  SharedPrefs(){
    _sharedPreferences=SharedPreferences.getInstance();
  }

  //=========================================================================================================================================================

  Future<void> setUserData(Map<String,dynamic> value) async{
    return _sharedPreferences.then((prefs){
      String dataObject=jsonEncode(value);
      return prefs.setString('basic_user_data', dataObject);
    });
  }

  Future<Map<String,dynamic>> get userData{
    return _sharedPreferences.then((prefs){
      String userDataString=prefs.getString('basic_user_data') ?? '{}';
      return jsonDecode(userDataString);
    });
  }

  //=========================================================================================================================================================

  Future<void> setAppLocaleProvider(String val){
    return _sharedPreferences.then((prefs){
      return prefs.setString('locale_code', val);
    });
  }

  Future<String> get appLocaleProvider{
    return _sharedPreferences.then((prefs){
      return prefs.getString('locale_code') ?? 'en';
    });
  }

  //=========================================================================================================================================================

  Future<bool> checkForKey(String key){
    return _sharedPreferences.then((prefs){
      return prefs.containsKey(key);
    });
  }

}