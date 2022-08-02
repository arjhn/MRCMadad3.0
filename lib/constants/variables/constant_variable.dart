class ConstantVariables{

String get newsURL=> 'https://polar-forest-55791.herokuapp.com/';
//String get newsURL=> 'http://192.168.29.193:8002/';

List<String> get languageList=>['English','हिंदी','తెలుగు','മലയാളം','தமிழ்','ಕನ್ನಡ'];

Map<String,String> get valMap=>{
    'English':'en',
    'हिंदी':'hi',
    'മലയാളം':'ml',
    'తెలుగు':'te',
    'தமிழ்':'ta',
    'ಕನ್ನಡ':'kn'
  };

Map<String,String> get reverseValMap=>{
    'en':'English',
    'hi':'हिंदी',
    'ml':'മലയാളം',
    'te':'తెలుగు',
    'ta':'தமிழ்',
    'kn':'ಕನ್ನಡ'
    };


}