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
    _teMessagesModel.add(MessagesModel(message: "హలో :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _teMessagesModel.add(MessagesModel(message: "మీరు ఎలా ఉన్నారు?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _teMessagesModel.add(MessagesModel(message: "నా పేరు హీరో. ఇక నుంచి నేను నీ స్నేహితుడినే.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _teMessagesModel.add(MessagesModel(message: "దయచేసి, మీ గురించి కొన్ని వివరాలను నాకు తెలియజేయగలరు.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _teMessagesModel.add(MessagesModel(message: "నాకు మీ ఫోన్ నంబర్ తెలియజేయండి", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "దయచేసి మీరు ఎక్కడి నుండి వస్తున్నారనే దాని గురించి కొన్ని వివరాలను నాకు తెలియజేయండి. \n \n మీ గ్రామం/పట్టణం/నగరం పేరు ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మీ జిల్లా పేరు?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మీరు చెందిన రాష్ట్రం పేరు?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "ఇప్పుడు, మీ కార్యాలయ వివరాలను నాకు తెలియజేయండి. \n \n మీరు ఏ పని చేస్తారు?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మీరు ఏ కంపెనీలో పని చేస్తున్నారు?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మీరు పనిచేసే నగరం?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మీరు పనిచేసే దేశం?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _teMessagesModel.add(MessagesModel(message: "మొత్తం సమాచారాన్ని అందించినందుకు ధన్యవాదాలు. మీకు నేను అవసరమైనప్పుడు, మీ హోమ్ స్క్రీన్‌లో కుడి దిగువ మూలలో ఉన్న సైరన్ చిహ్నాన్ని క్లిక్ చేయడం ద్వారా మీరు నన్ను యాక్సెస్ చేయవచ్చు", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addTAMessages(){
    _taMessagesModel.add(MessagesModel(message: "வணக்கம் :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் எப்படி இருக்கிறீர்கள் ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _taMessagesModel.add(MessagesModel(message: "என் பெயர் ஹீரோ. இனிமேல் நான் உன் நண்பனாக இருப்பேன்.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _taMessagesModel.add(MessagesModel(message: "தயவுசெய்து, உங்களைப் பற்றிய சில விவரங்களை எனக்குத் தெரிவிக்க முடியுமா ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _taMessagesModel.add(MessagesModel(message: "உங்கள் தொலைபேசி எண்ணை எனக்குத் தெரியப்படுத்துங்கள்", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் எங்கிருந்து வருகிறீர்கள் என்பது பற்றிய சில விவரங்களை தயவுசெய்து எனக்குத் தெரியப்படுத்துங்கள். \n \n உங்கள் கிராமம்/நகரம்/நகரத்தின் பெயர் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "உங்கள் மாவட்டத்தின் பெயர் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் சேர்ந்த மாநிலத்தின் பெயர் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "இப்போது, உங்கள் பணியிடத்தின் விவரங்களை எனக்குத் தெரியப்படுத்துங்கள். \n \n நீங்கள் என்ன வேலை செய்கிறீர்கள் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் எந்த நிறுவனத்தில் வேலை செய்கிறீர்கள் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் பணிபுரியும் நகரம் ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "நீங்கள் வேலை செய்யும் நாடு ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _taMessagesModel.add(MessagesModel(message: "அனைத்து தகவல்களையும் வழங்கியதற்கு நன்றி. உங்களுக்குத் தேவைப்படும் போதெல்லாம், உங்கள் முகப்புத் திரையில் கீழ் வலது மூலையில் உள்ள சைரன் ஐகானைக் கிளிக் செய்வதன் மூலம் என்னை அணுகலாம்", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addMLMessages(){
    _mlMessagesModel.add(MessagesModel(message: "ഹലോ :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _mlMessagesModel.add(MessagesModel(message: "എന്തൊക്കെയുണ്ട് ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _mlMessagesModel.add(MessagesModel(message: "എന്റെ പേര് നായകൻ. ഇനി മുതൽ ഞാൻ നിങ്ങളുടെ സുഹൃത്തായിരിക്കും.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _mlMessagesModel.add(MessagesModel(message: "ദയവുചെയ്ത്, നിങ്ങളെക്കുറിച്ചുള്ള കുറച്ച് വിശദാംശങ്ങൾ എന്നെ അറിയിക്കാമോ ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങളുടെ ഫോൺ നമ്പർ എന്നെ അറിയിക്കൂ ", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങൾ എവിടെ നിന്നാണ് എന്നതിനെക്കുറിച്ചുള്ള കുറച്ച് വിശദാംശങ്ങൾ ദയവായി എന്നെ അറിയിക്കുക. \n \n നിങ്ങളുടെ ഗ്രാമത്തിന്റെ/നഗരത്തിന്റെ/നഗരത്തിന്റെ പേര് ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങളുടെ ജില്ലയുടെ പേര് ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങൾ ഉൾപ്പെടുന്ന സംസ്ഥാനത്തിന്റെ പേര് ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "ഇപ്പോൾ, നിങ്ങളുടെ ജോലിസ്ഥലത്തിന്റെ വിശദാംശങ്ങൾ എന്നെ അറിയിക്കൂ. \n \n നിങ്ങൾ എന്ത് ജോലിയാണ് ചെയ്യുന്നത് ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങൾ ഏത് കമ്പനിയിലാണ് ജോലി ചെയ്യുന്നത് ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങൾ ജോലി ചെയ്യുന്ന നഗരം ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "നിങ്ങൾ ജോലി ചെയ്യുന്ന രാജ്യം ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _mlMessagesModel.add(MessagesModel(message: "എല്ലാ വിവരങ്ങളും നൽകിയതിന് നന്ദി. നിങ്ങൾക്ക് എന്നെ ആവശ്യമുള്ളപ്പോഴെല്ലാം, നിങ്ങളുടെ ഹോം സ്ക്രീനിൽ താഴെ വലത് കോണിലുള്ള സൈറൺ ഐക്കണിൽ ക്ലിക്കുചെയ്ത് നിങ്ങൾക്ക് എന്നെ ആക്സസ് ചെയ്യാൻ കഴിയും", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addKAMessages(){
    _kaMessagesModel.add(MessagesModel(message: "ನಮಸ್ಕಾರ :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಹೇಗಿದ್ದೀರಿ ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _kaMessagesModel.add(MessagesModel(message: "ನನ್ನ ಹೆಸರು ನಾಯಕ. ಇನ್ನು ಮುಂದೆ ನಾನು ನಿನ್ನ ಸ್ನೇಹಿತನಾಗುತ್ತೇನೆ.", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _kaMessagesModel.add(MessagesModel(message: "ದಯವಿಟ್ಟು, ನಿಮ್ಮ ಬಗ್ಗೆ ಕೆಲವು ವಿವರಗಳನ್ನು ನನಗೆ ತಿಳಿಸಬಹುದೇ ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _kaMessagesModel.add(MessagesModel(message: "ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನನಗೆ ತಿಳಿಸಿ", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಎಲ್ಲಿಂದ ಬಂದಿದ್ದೀರಿ ಎಂಬುದರ ಕುರಿತು ಕೆಲವು ವಿವರಗಳನ್ನು ದಯವಿಟ್ಟು ನನಗೆ ತಿಳಿಸಿ. \n \n ನಿಮ್ಮ ಗ್ರಾಮ/ಪಟ್ಟಣ/ನಗರದ ಹೆಸರು ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನಿಮ್ಮ ಜಿಲ್ಲೆಯ ಹೆಸರು ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಸೇರಿರುವ ರಾಜ್ಯದ ಹೆಸರು ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ಈಗ, ನಿಮ್ಮ ಕೆಲಸದ ಸ್ಥಳದ ವಿವರಗಳನ್ನು ನನಗೆ ತಿಳಿಸಿ. \n \n ನೀವು ಯಾವ ಕೆಲಸ ಮಾಡುತ್ತೀರಿ ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಯಾವ ಕಂಪನಿಯಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದೀರಿ ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಕೆಲಸ ಮಾಡುವ ನಗರ ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ನೀವು ಕೆಲಸ ಮಾಡುವ ದೇಶ ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _kaMessagesModel.add(MessagesModel(message: "ಎಲ್ಲಾ ಮಾಹಿತಿಯನ್ನು ಒದಗಿಸಿದ್ದಕ್ಕಾಗಿ ಧನ್ಯವಾದಗಳು. ನಿಮಗೆ ನನ್ನ ಅಗತ್ಯವಿದ್ದಾಗ, ನಿಮ್ಮ ಹೋಮ್ ಸ್ಕ್ರೀನ್‌ನಲ್ಲಿ ಕೆಳಗಿನ ಬಲ ಮೂಲೆಯಲ್ಲಿರುವ ಸೈರನ್ ಐಕಾನ್ ಅನ್ನು ಕ್ಲಿಕ್ ಮಾಡುವ ಮೂಲಕ ನೀವು ನನ್ನನ್ನು ಪ್ರವೇಶಿಸಬಹುದು", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

  void addHIMessages(){
    _hiMessagesModel.add(MessagesModel(message: "नमस्ते :)",isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Hello :)"));
    _hiMessagesModel.add(MessagesModel(message: "क्या हाल है ?", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "I'm good !"));
    _hiMessagesModel.add(MessagesModel(message: "मेरा नाम हीरो है। मैं अब से आपका दोस्त बनूंगा।", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "cool !"));
    _hiMessagesModel.add(MessagesModel(message: "कृपया, क्या आप मुझे अपने बारे में कुछ विवरण बता सकते हैं।", isHero: true, enumResponseType: EnumResponseType.Fixed,responseValue: "Okay."));
    _hiMessagesModel.add(MessagesModel(message: "मुझे अपना फोन नंबर बताएं", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "कृपया मुझे कुछ विवरण बताएं कि आप कहां से हैं। \n \n आपके गांव/नगर/शहर का नाम ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "आपके जिले का नाम ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "आप जिस राज्य के हैं उसका नाम ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "अब, मुझे अपने कार्यस्थल का विवरण बताएं। \n \n तुम क्या काम करते हो ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "आप किस कंपनी में काम करते हैं ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "आप जिस शहर में काम करते हैं ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "जिस देश में आप काम करते हैं ?", isHero: true, enumResponseType: EnumResponseType.Custom));
    _hiMessagesModel.add(MessagesModel(message: "सारी जानकारी उपलब्ध कराने के लिए धन्यवाद। जब भी आपको मेरी आवश्यकता हो, आप अपनी होम स्क्रीन पर निचले दाएं कोने में सायरन आइकन पर क्लिक करके मुझे एक्सेस कर सकते हैं", isHero: true, enumResponseType: EnumResponseType.DialogComplete));
  }

}