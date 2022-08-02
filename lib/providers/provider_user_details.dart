import 'package:flutter/cupertino.dart';
import 'package:mrc_madad_3/cache/shared_prefs/shared_prefs.dart';

class ProviderUserDetails with ChangeNotifier{

  late SharedPrefs _sharedPrefs;
  late Map<String,dynamic> _userData={};

  ProviderUserDetails(){
    _sharedPrefs=SharedPrefs();
    _sharedPrefs.userData.then((value){
      _userData=value;
    });
  }

  Future<void> setUserData(Map<String,dynamic> valOfUser) async{
    _sharedPrefs.setUserData(valOfUser);
  }

  void get getOfUserData{
    _sharedPrefs.userData.then((value){
      _userData=value;
      notifyListeners();
    });
  }

  Map<String,dynamic> get userData => _userData;

}