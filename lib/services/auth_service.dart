import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:attendanceapp/models/either.dart';

class Authentication {
  FirebaseAuth _fbAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseUser _user;

  FirebaseUser get user => _user;

  Future<Either> logOut() async {
    await _fbAuth.signOut();
    return Either(
        errorMessage: '', successMessage: '', errorCode: '', hasError: false, success: true);
  }

  Future<Either> login() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final auth = await _fbAuth.signInWithCredential(credential);
      if (auth != null) {
        _user = auth.user;
        return Either(
            hasError: false, success: true, errorCode: '', successMessage: '', errorMessage: '');
      } else {
        return Either(
            hasError: false, success: false, errorCode: '', successMessage: '', errorMessage: '');
      }
    } catch (e) {
      return Either(
          hasError: true,
          success: false,
          errorCode: e.code,
          successMessage: '',
          errorMessage: e.message);
    }
  }

  Future<Either> checkLogin() async {
    try {
      FirebaseUser user = await _fbAuth.currentUser();
      if (user != null) {
        _user = user;
        return Either(success: true, hasError: false, errorMessage: '', successMessage: '');
      } else {
        return Either(success: false, hasError: false, errorMessage: '', successMessage: '');
      }
    } catch (e) {
      return Either(
          success: false,
          hasError: true,
          errorMessage: e.message,
          errorCode: e.code,
          successMessage: '');
    }
  }
}
