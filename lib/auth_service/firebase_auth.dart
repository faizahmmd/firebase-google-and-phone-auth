import 'dart:async';

import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  //final FirebaseAuth auth;
  String phoneNo, verificationId;
  //Auth({this.auth});

  // Stream<User> get user => auth.authStateChanges();

  Future<String> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (googleUser != null) {
        ObjectFactory().appHive.putPhotoUrl(value: googleUser.photoUrl);
        ObjectFactory().appHive.displayNamePut(value: googleUser.displayName);
        ObjectFactory().appHive.putEmail(value: googleUser.email);
        ObjectFactory().appHive.putToken(token: googleAuth.idToken);
        ObjectFactory()
            .appHive
            .putUid(value: FirebaseAuth.instance.currentUser.uid);
      }
      String status = "Success";
      return status.trim();
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      String status = "Success";
      return status.trim();
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyPhone(int mobileNumber) async {
    String status;
    final PhoneVerificationCompleted verified =
        (PhoneAuthCredential authResult) {
      //FirebaseAuth.instance.signInWithCredential(authResult);
      status = "suppressed";
    };
    final PhoneVerificationFailed verifiedFailed =
        (FirebaseAuthException authException) {
      print("verification failed " + authException.message);
      status = authException.message;
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      status = "Success";
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
      status = "timed out";
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+' + mobileNumber.toString().trim(),
      verificationCompleted: verified,
      verificationFailed: verifiedFailed,
      codeSent: smsSent,
      timeout: Duration(seconds: 25),
      codeAutoRetrievalTimeout: autoTimeOut,
    );

    return status;
  }

  Future<String> signInWithPhone(int otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.toString().trim(),
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        ObjectFactory().appHive.putUid(value: value.user.uid);
        ObjectFactory()
            .appHive
            .displayNamePut(value: value.user.phoneNumber.toString());
      });
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}
