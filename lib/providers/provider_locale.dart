import 'package:flutter/cupertino.dart';
import 'package:mrc_madad_3/cache/shared_prefs/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderLocale with ChangeNotifier{

  late Locale _appLocale;
  late SharedPrefs _sharedPrefsHelper;

  ProviderLocale(){
    _sharedPrefsHelper=SharedPrefs();
    if(checkForSavedLocale())
      _appLocale=appLocale;
    else
      _appLocale=Locale('en');
  }

  Locale get appLocale{
    _sharedPrefsHelper.appLocaleProvider.then((value){
      _appLocale=Locale(value);
    });
    return _appLocale;
  }

  bool checkForSavedLocale(){
    bool flag=false;
    _sharedPrefsHelper.checkForKey('locale_code').then((value){
      flag=value;
    });
    return flag;
  }

  void setAppLocale(String locale_code){
    _appLocale=Locale(locale_code);
    _sharedPrefsHelper.setAppLocaleProvider(locale_code);
    notifyListeners();
  }

}