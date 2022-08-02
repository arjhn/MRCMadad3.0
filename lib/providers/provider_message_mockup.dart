import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';

class ProviderMessageMockup with ChangeNotifier{

  List<MessagesModel> _compQuestionnaire=[];
  List<MessagesModel> _userAnswers=[];
  List<MessagesModel> _totalList=[];
  int compQuestionnairePointer=0;
  EnumResponseType _latestResponseType=EnumResponseType.Custom;
  bool _loadingMessage=false;

  ProviderMessageMockup(){
    /**_compQuestionnaire.add(MessagesModel(message: "Hello", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _compQuestionnaire.add(MessagesModel(message: "How are you ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _compQuestionnaire.add(MessagesModel(message: "What's up with You ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _compQuestionnaire.add(MessagesModel(message: "When were you born ?", isHero: true, enumResponseType: EnumResponseType.Date));
    _compQuestionnaire.add(MessagesModel(message: "Hey", isHero: true, enumResponseType: EnumResponseType.MultipleMessages));
    _compQuestionnaire.add(MessagesModel(message: "How are You ?", isHero: true, enumResponseType: EnumResponseType.MultipleMessages));
    _compQuestionnaire.add(MessagesModel(message: "Hope you are good !", isHero: true,responseValue: "Hello", enumResponseType: EnumResponseType.MultipleMessages));
    _compQuestionnaire.add(MessagesModel(message: "Please Upload your Image", isHero: true, enumResponseType: EnumResponseType.Image));
    _compQuestionnaire.add(MessagesModel(message: "Type your Problem", isHero: true, enumResponseType: EnumResponseType.AudioTextInput));
    _compQuestionnaire.add(MessagesModel(message: "Thank you for providing Details", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
    _totalList.add(_compQuestionnaire[0]);
    compQuestionnairePointer++;
     **/
  }

  List<MessagesModel> get totalList=>_totalList;
  EnumResponseType get latestResponseType=>_latestResponseType;
  bool get loadingMessage=>_loadingMessage;
  List<MessagesModel> get userAnswers => _userAnswers;

  void addMessage(MessagesModel value){
    if(compQuestionnairePointer<=_compQuestionnaire.length) {
      _userAnswers.add(value);
      _totalList.add(value);
      if(compQuestionnairePointer<_compQuestionnaire.length)
        _totalList.add(MessagesModel(message: '...',
            isHero: true,
            enumResponseType: EnumResponseType.Loading));
      delayCompQuestionAdd();
      notifyListeners();
    }
  }

  Timer delayCompQuestionAdd() {
    return Timer(Duration(milliseconds: 1000), (){
      _totalList.removeLast();
      _totalList.add(_compQuestionnaire[compQuestionnairePointer]);
      _latestResponseType=_compQuestionnaire[compQuestionnairePointer].enumResponseType;
      compQuestionnairePointer++;
      notifyListeners();
    });
  }

  void setCompQuestionnaire(List<MessagesModel> _messageData){
    _compQuestionnaire=_messageData;
    _totalList.clear();
    _userAnswers.clear();
    compQuestionnairePointer=0;
    _totalList.add(_compQuestionnaire[compQuestionnairePointer]);
    compQuestionnairePointer++;
    notifyListeners();
  }

}