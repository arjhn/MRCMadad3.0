import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrc_madad_3/cache/shared_prefs/shared_prefs.dart';
import 'package:mrc_madad_3/constants/enums/enum_firebase_sign_in.dart';
import 'package:mrc_madad_3/models/model_user_sign_in.dart';

class ProviderAuthentication with ChangeNotifier{

  late FirebaseAuth _firebaseAuth;
  late GoogleSignIn _googleSignIn;
  late EnumFirebaseSignIn _enumFirebaseSignIn;
  late User _userData;
  late SharedPrefs _sharedPrefs;
  late EnumUserPresence _enumUserPresence;

  ProviderAuthentication(){
    _firebaseAuth=FirebaseAuth.instance;
    _googleSignIn=GoogleSignIn();
    _firebaseAuth.authStateChanges().listen((user)=>onAuthStateChanged(user));
    _enumFirebaseSignIn=EnumFirebaseSignIn.Initialized;
    _enumUserPresence=EnumUserPresence.NotDetected;
    _sharedPrefs=SharedPrefs();
    userPresenceCheck();
  }

  UserModelSignIn? _userModelSignIn(User? user){

    if(user==null)
      return null;
    print(user.metadata.creationTime);
    return UserModelSignIn(
        uid: user.uid,
        email: user.email,
        phoneNumber: user.phoneNumber,
        profilePicURL: user.photoURL,
        displayName: user.displayName,
        creationTime: user.metadata.creationTime.toString()
    );
  }

  Future<void> onAuthStateChanged(User? user) async{
    if(user !=null){
      _userModelSignIn(user);
      _userData=user;
      _enumFirebaseSignIn=EnumFirebaseSignIn.Authenticated;
      _sharedPrefs.setUserData({
        'uid':user.uid,
        'email':user.email,
        'phoneNumber':user.phoneNumber,
        'profilePicURL':user.photoURL,
        'displayName':user.displayName,
        'creationTIme':user.metadata.creationTime.toString()
      });
      notifyListeners();
      userPresenceCheck();
    }
  }

  Future<User?> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSingInAuthentication=await googleSignInAccount!.authentication;
      _enumFirebaseSignIn=EnumFirebaseSignIn.Authenticating;
      notifyListeners();
      final AuthCredential authCredential=GoogleAuthProvider.credential(
        idToken: googleSingInAuthentication.idToken,
        accessToken:googleSingInAuthentication.accessToken
      );
      UserCredential userCredential=await _firebaseAuth.signInWithCredential(authCredential);
      _enumFirebaseSignIn=EnumFirebaseSignIn.Authenticated;
    }on FirebaseAuthException catch(e){
      print(e.message);
      _enumFirebaseSignIn=EnumFirebaseSignIn.Failure;
      throw e;
    }
  }

  EnumUserPresence get enumUserPresence=>_enumUserPresence;

  void userPresenceCheck(){
    if(FirebaseAuth.instance.currentUser!=null){
      _enumUserPresence=EnumUserPresence.Detected;
      notifyListeners();
    }
  }


}
