import 'package:ani_going/constant/AppColor.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/translation/app_translation.dart';
import 'package:ani_going/utils/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    try {
      await firebaseAuth.signInWithCredential(credential);
      SharePref().setPrefs(true);
      CustomSnackbar.snackBar(
          '${AppTranslation.welcome.tr} ${firebaseAuth.currentUser!.email}',
          AppColor.primary);
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.snackBar(e.toString(), AppColor.error);
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseFirestore.instance
                  .collection('users')
                  .doc(value.user!.uid)
                  .set({
                'uid': value.user!.uid,
                'email': email,
              }));
      SharePref().setPrefs(true);
      CustomSnackbar.snackBar(
          '${AppTranslation.welcome.tr} ${firebaseAuth.currentUser!.email}',
          AppColor.primary);
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.snackBar(e.toString(), AppColor.error);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      SharePref().setPrefs(true);
      CustomSnackbar.snackBar(
          '${AppTranslation.welcome.tr} ${firebaseAuth.currentUser!.email}',
          AppColor.primary);
      Get.offNamed(AppRoutes.navbar);
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.snackBar(e.toString(), AppColor.error);
    }
  }

  Future<void> signOutGoogle() async {
    firebaseAuth.signOut();
    GoogleSignIn().signOut();
    SharePref().removePrefs();
    CustomSnackbar.snackBar(
        '${AppTranslation.byebye.tr} ${firebaseAuth.currentUser!.email}',
        AppColor.primary);
    Get.offNamed(AppRoutes.loginPage);
  }
}
