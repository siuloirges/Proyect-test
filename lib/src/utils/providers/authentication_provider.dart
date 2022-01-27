import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {

    final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthenticationProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn}): _firebaseAuth = FirebaseAuth.instance, _googleSignIn = GoogleSignIn();


  //SingInWithGoogle
  Future<FirebaseUser> sinInWithGoogle() async {

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  
  } 

  // SinInWithCredentials
  Future<void> sinInWithCredentials(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  //SingUp
  Future<void> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //SingOut
  Future<void> signOut(String email, String password){
    return Future.wait([_firebaseAuth.signOut(),_googleSignIn.signOut()]);
  }

  //is login?
  Future<bool> isSinnedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  //Get user
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

}