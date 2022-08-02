import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';

class MessagesModel{

  String message;
  bool isHero;
  EnumResponseType enumResponseType;
  String? responseValue;

  MessagesModel({
    required this.message,
    required this.isHero,
    required this.enumResponseType,
    this.responseValue
  });

}