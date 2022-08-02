import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';

class MessagesComplaint{

  List<MessagesModel> _enMessagesModel=[];

  MessagesComplaint(){
    addENMessages();
  }

  Map<String,List<MessagesModel>> get complaintMessages=>{
      'en': _enMessagesModel
  };

  void addENMessages(){
    _enMessagesModel.add(MessagesModel(message: "Hello \n We are here for you !",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
   /** _enMessagesModel.add(MessagesModel(message: "Kindly Let us know a the following details, as it would help in solving your issue faster.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay !"));
    _enMessagesModel.add(MessagesModel(message: "Your name ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Your Phone Number", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Name of the company you work at ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Name of the City you work in ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "Name of the Country you work in ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _enMessagesModel.add(MessagesModel(message: "A photo of your passport", isHero: true, enumResponseType: EnumResponseType.Image));
    _enMessagesModel.add(MessagesModel(message: "A photo of your visa", isHero: true, enumResponseType: EnumResponseType.Image)); **/
    _enMessagesModel.add(MessagesModel(message: "Kindly let us know your complaint. You can either record it or type it", isHero: true, enumResponseType: EnumResponseType.AudioTextInput));
    _enMessagesModel.add(MessagesModel(message: "Thank you for letting us know your complaint. We will get back to you shortly.", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

}