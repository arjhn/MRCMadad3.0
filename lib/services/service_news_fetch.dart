import 'package:dio/dio.dart';
import 'package:mrc_madad_3/constants/variables/constant_variable.dart';
import 'package:mrc_madad_3/models/model_news_data.dart';

class ServiceNewsFetch{

  String URI=ConstantVariables().newsURL;

  Future <List<ModelNewsData>> fetchNewsHTTP() async{
    var dio=Dio();
    final response=await dio.get(URI);
    return (response.data).map<ModelNewsData>((json)=>ModelNewsData.fromJson(json)).toList();
  }

  Future<Map<String,List<ModelNewsData>>> newsSort(List<ModelNewsData> _newData) async{

    Map<String,List<ModelNewsData>> _newsByLanguage={
      "en":[],
      "te":[],
      "ml":[],
      "ta":[],
      "hi":[]
    };

    for(var i=0;i<_newData.length;i++){
      _newsByLanguage[_newData[i].language]!.add(_newData[i]);
    }

    return _newsByLanguage;
  }

  Future<List> fetchDataHTTP() async{
    var dio=Dio();
    final response=await dio.get(URI);
    return response.data;
  }

  void convertList(List<ModelNewsData> _newsData){
    _newsData.map<Map<String, dynamic>>((newsmodeldata) => ModelNewsData().toJson()).toList();
  }
}