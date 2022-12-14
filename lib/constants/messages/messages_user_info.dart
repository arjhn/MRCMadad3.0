import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';

class MessagesUserInfo{

  List<MessagesModel> _enMessagesModel=[];
  List<MessagesModel> _teMessagesModel=[];
  List<MessagesModel> _taMessagesModel=[];
  List<MessagesModel> _mlMessagesModel=[];
  List<MessagesModel> _kaMessagesModel=[];
  List<MessagesModel> _hiMessagesModel=[];

  MessagesUserInfo(){
    addENMessages();
    addTEMessages();
    addTAMessages();
    addMLMessages();
    addKAMessages();
    addHIMessages();
  }

  Map<String,List<MessagesModel>> get complaintMessages=>{
    'en': _enMessagesModel,
    'te': _teMessagesModel,
    'ta':_taMessagesModel,
    'ka':_kaMessagesModel,
    'ml':_mlMessagesModel,
    'hi':_hiMessagesModel
  };

  void addENMessages(){
    _enMessagesModel.add(MessagesModel(message: "Hello :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _enMessagesModel.add(MessagesModel(message: "How have you been ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _enMessagesModel.add(MessagesModel(message: "I'm hero btw, I will be your virtual friend from here on.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _enMessagesModel.add(MessagesModel(message: "Kindly, can you let me know a few details about yourself.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _enMessagesModel.add(MessagesModel(message: "Let me know your phone Number?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Kindly let me know a few details about where you are from. \n \n The name of your village/town/city ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "The name of your district ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "The name of the state you belong to ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Now, let me know the details of your workplace. \n \n what work do you do ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Which company do you work in ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "The city you work in ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "The country where you work ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Thank you for providing all the information. Whenever you need me, you can access me by click the SOS icon in the bottom right corner of your home screen", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addTEMessages(){
    _teMessagesModel.add(MessagesModel(message: "????????? :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _teMessagesModel.add(MessagesModel(message: "???????????? ????????? ??????????????????????", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _teMessagesModel.add(MessagesModel(message: "?????? ???????????? ????????????. ?????? ??????????????? ???????????? ?????? ????????????????????????????????????.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _teMessagesModel.add(MessagesModel(message: "??????????????????, ?????? ????????????????????? ?????????????????? ???????????????????????? ???????????? ????????????????????????????????????.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _teMessagesModel.add(MessagesModel(message: "???????????? ?????? ???????????? ??????????????? ?????????????????????????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "?????????????????? ???????????? ?????????????????? ??????????????? ???????????????????????????????????? ???????????? ????????????????????? ?????????????????? ???????????????????????? ???????????? ?????????????????????????????????. \n \n ?????? ??????????????????/??????????????????/???????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "?????? ?????????????????? ?????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "???????????? ?????????????????? ???????????????????????? ?????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "?????????????????????, ?????? ???????????????????????? ???????????????????????? ???????????? ?????????????????????????????????. \n \n ???????????? ??? ????????? ?????????????????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "???????????? ??? ???????????????????????? ????????? ?????????????????????????????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "???????????? ????????????????????? ?????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "???????????? ????????????????????? ?????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "?????????????????? ????????????????????????????????? ??????????????????????????????????????? ??????????????????????????????. ???????????? ???????????? ???????????????????????????????????????, ?????? ???????????? ????????????????????????????????? ???????????? ??????????????? ??????????????? ???????????? ??????????????? ?????????????????????????????? ?????????????????? ??????????????? ?????????????????? ???????????? ??????????????? ???????????????????????? ????????????????????????", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addTAMessages(){
    _taMessagesModel.add(MessagesModel(message: "????????????????????? :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ?????????????????? ?????????????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _taMessagesModel.add(MessagesModel(message: "????????? ??????????????? ????????????. ????????????????????? ???????????? ????????? ????????????????????? ???????????????????????????.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _taMessagesModel.add(MessagesModel(message: "??????????????????????????????, ???????????????????????? ?????????????????? ????????? ??????????????????????????? ???????????????????????? ??????????????????????????? ???????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _taMessagesModel.add(MessagesModel(message: "?????????????????? ???????????????????????? ??????????????? ???????????????????????? ?????????????????????????????????????????????????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ????????????????????????????????? ???????????????????????????????????? ?????????????????? ?????????????????? ????????? ??????????????????????????? ?????????????????????????????? ???????????????????????? ?????????????????????????????????????????????????????????. \n \n ?????????????????? ?????????????????????/???????????????/??????????????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "?????????????????? ???????????????????????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ????????????????????? ????????????????????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "?????????????????????, ?????????????????? ???????????????????????????????????? ??????????????????????????? ???????????????????????? ?????????????????????????????????????????????????????????. \n \n ????????????????????? ???????????? ???????????? ??????????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ???????????? ???????????????????????????????????? ???????????? ??????????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ????????????????????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ???????????? ???????????????????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "????????????????????? ???????????????????????????????????? ???????????????????????????????????? ???????????????. ???????????????????????????????????? ????????????????????????????????? ??????????????????????????????, ?????????????????? ??????????????????????????? ???????????????????????? ???????????? ???????????? ???????????????????????? ???????????? ??????????????? ????????????????????? ?????????????????? ???????????????????????? ??????????????? ??????????????? ????????????????????????", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addMLMessages(){
    _mlMessagesModel.add(MessagesModel(message: "???????????? :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _mlMessagesModel.add(MessagesModel(message: "???????????????????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _mlMessagesModel.add(MessagesModel(message: "??????????????? ???????????? ???????????????. ????????? ???????????? ????????? ??????????????????????????? ???????????????????????????????????????????????????.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _mlMessagesModel.add(MessagesModel(message: "??????????????????????????????, ???????????????????????????????????????????????????????????? ????????????????????? ????????????????????????????????? ??????????????? ????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _mlMessagesModel.add(MessagesModel(message: "??????????????????????????? ????????? ??????????????? ??????????????? ??????????????????????????? ", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "?????????????????? ??????????????? ???????????????????????? ??????????????????????????????????????????????????????????????? ????????????????????? ????????????????????????????????? ?????????????????? ??????????????? ??????????????????????????????. \n \n ??????????????????????????? ???????????????????????????????????????/?????????????????????????????????/????????????????????????????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "??????????????????????????? ??????????????????????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "?????????????????? ????????????????????????????????? ????????????????????????????????????????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "??????????????????, ??????????????????????????? ???????????????????????????????????????????????? ????????????????????????????????? ??????????????? ???????????????????????????. \n \n ?????????????????? ??????????????? ???????????????????????? ????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "?????????????????? ????????? ???????????????????????????????????? ???????????? ????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "?????????????????? ???????????? ??????????????????????????? ???????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "?????????????????? ???????????? ??????????????????????????? ?????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "??????????????? ?????????????????????????????? ??????????????????????????? ???????????????. ?????????????????????????????? ??????????????? ???????????????????????????????????????????????????????????????, ??????????????????????????? ????????? ??????????????????????????? ???????????? ???????????? ??????????????????????????? ???????????? ????????????????????? ?????????????????????????????????????????? ?????????????????????????????? ??????????????? ?????????????????? ????????????????????? ??????????????????", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addKAMessages(){
    _kaMessagesModel.add(MessagesModel(message: "????????????????????? :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _kaMessagesModel.add(MessagesModel(message: "??????????????? ???????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ??????????????? ????????????. ??????????????? ??????????????? ???????????? ??????????????? ???????????????????????????????????????????????????.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _kaMessagesModel.add(MessagesModel(message: "????????????????????????, ??????????????? ??????????????? ??????????????? ?????????????????????????????? ???????????? ?????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _kaMessagesModel.add(MessagesModel(message: "??????????????? ???????????? ????????????????????????????????? ???????????? ??????????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ????????????????????? ?????????????????????????????? ?????????????????? ?????????????????? ??????????????? ?????????????????????????????? ???????????????????????? ???????????? ??????????????????. \n \n ??????????????? ???????????????/???????????????/???????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "??????????????? ????????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ????????????????????? ?????????????????? ??????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "??????, ??????????????? ??????????????? ??????????????? ?????????????????????????????? ???????????? ??????????????????. \n \n ???????????? ????????? ???????????? ?????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ????????? ?????????????????????????????? ???????????? ?????????????????????????????????????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ???????????? ??????????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "???????????? ???????????? ??????????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "??????????????? ????????????????????????????????? ????????????????????????????????????????????? ??????????????????????????????. ??????????????? ???????????? ????????????????????????????????????, ??????????????? ???????????? ?????????????????????????????????????????? ?????????????????? ?????? ???????????????????????????????????? ??????????????? ??????????????? ??????????????? ?????????????????? ??????????????? ???????????? ???????????? ???????????????????????? ???????????????????????????????????????", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addHIMessages(){
    _hiMessagesModel.add(MessagesModel(message: "?????????????????? :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _hiMessagesModel.add(MessagesModel(message: "???????????? ????????? ?????? ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _hiMessagesModel.add(MessagesModel(message: "???????????? ????????? ???????????? ????????? ????????? ?????? ?????? ???????????? ??????????????? ?????????????????????", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _hiMessagesModel.add(MessagesModel(message: "???????????????, ???????????? ?????? ???????????? ???????????? ???????????? ????????? ????????? ??????????????? ????????? ???????????? ????????????", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _hiMessagesModel.add(MessagesModel(message: "???????????? ???????????? ????????? ???????????? ???????????????", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "??????????????? ???????????? ????????? ??????????????? ??????????????? ?????? ?????? ???????????? ?????? ???????????? \n \n ???????????? ????????????/?????????/????????? ?????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "???????????? ???????????? ?????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "?????? ????????? ??????????????? ?????? ????????? ???????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "??????, ???????????? ???????????? ??????????????????????????? ?????? ??????????????? ?????????????????? \n \n ????????? ???????????? ????????? ???????????? ?????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "?????? ????????? ??????????????? ????????? ????????? ???????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "?????? ????????? ????????? ????????? ????????? ???????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "????????? ????????? ????????? ?????? ????????? ???????????? ????????? ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "???????????? ????????????????????? ?????????????????? ??????????????? ?????? ????????? ???????????????????????? ?????? ?????? ???????????? ???????????? ???????????????????????? ??????, ?????? ???????????? ????????? ????????????????????? ?????? ??????????????? ???????????? ???????????? ????????? ??????????????? ???????????? ?????? ??????????????? ???????????? ???????????? ?????????????????? ?????? ???????????? ?????????", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

}