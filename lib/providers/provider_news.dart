import 'package:flutter/cupertino.dart';
import 'package:mrc_madad_3/cache/shared_prefs/shared_prefs.dart';
import 'package:mrc_madad_3/constants/enums/enum_news_fetch.dart';
import 'package:mrc_madad_3/models/model_news_data.dart';
import 'package:mrc_madad_3/services/service_news_fetch.dart';

class ProviderNews with ChangeNotifier{

  late SharedPrefs _sharedPrefs;
  List<ModelNewsData> _newsDataMND=<ModelNewsData>[];
  Map<String,List<ModelNewsData>> _newByLanguage={};
  late EnumNewsFetch _enumNewsFetch;

  ProviderNews(){
    _sharedPrefs=SharedPrefs();
    newsFetch();
    _enumNewsFetch=EnumNewsFetch.Incomplete;
    notifyListeners();
  }

  Future<void> newsFetch() async{
    _newsDataMND=await ServiceNewsFetch().fetchNewsHTTP();
    _newByLanguage=await ServiceNewsFetch().newsSort(_newsDataMND);
    _enumNewsFetch=EnumNewsFetch.Complete;
    notifyListeners();
  }

  EnumNewsFetch get enumNewsFetch=>_enumNewsFetch;
  Map<String,List<ModelNewsData>> get newByLanguage=>_newByLanguage;

}