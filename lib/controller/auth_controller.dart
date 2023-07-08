import 'package:ani_going/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.toString(), e.toString());
    }
  }

  signUpWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseFirestore.instance
                  .collection('users')
                  .doc(value.user!.uid)
                  .set({
                'uid': value.user!.uid,
                'email': email,
              }));
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('SignUp failed', e.toString());
    }
  }

  signInWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('SignIn failed', e.toString());
    }
  }

  signOutGoogle() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    Get.offNamed(AppRoutes.loginPage);
  }
}
