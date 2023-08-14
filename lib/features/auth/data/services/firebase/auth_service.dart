import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_search_app/constants/named_routes.dart';

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        return e.code;
      } else if (e.code == 'operation-not-allowed') {
        return e.code;
      } else {
        return e.code;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return e.code;
      } else if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      } else {
        return e.toString();
      }
    }
  }

  Future<void> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Start the sign in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create credentials
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // return the credential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  //  OTP
  Future<void> registerUserWithPhone(
    String mobile,
    BuildContext context,
  ) async {
    final auth = FirebaseAuth.instance;
    // print(mobile);
    await auth.verifyPhoneNumber(
      phoneNumber: '+91$mobile',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        Navigator.pushNamed(
          context,
          NamedRoutes.verifyCode,
          arguments: verificationId,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(
        seconds: 120,
      ),
    );
  }
}
