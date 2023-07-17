import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/services/utilities.dart';
import 'package:ani_going/services/color.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyListController extends GetxController {
  var myList = RxList<MyList>([]);
  RxBool isAdded = false.obs;
  final collection = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('mylist');
  final currentUser = FirebaseAuth.instance.currentUser!;

  void getTitle(String title) async {
    try {
      var response = await collection.doc(title).get();
      if (response.exists) {
        isAdded.value = true;
        print(response.toString());
      } else {
        isAdded.value = false;
        print('title tidak ada');
      }
    } catch (e) {
      print('error');
    }
  }

  Stream getMyList() {
    print('getmylist');
    return collection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => MyList.fromJson(doc.data())).toList());
  }

  Future<void> addMyList(
    bool isOngoing,
    AnimeOngoing? animeOngoing,
    AnimeUpcoming? animeUpcoming,
  ) async {
    try {
      if (isAdded.value == true) {
        Utilities.snackBar('Sudah ada di My List', AppColor.error);
      } else if (isOngoing) {
        await collection.doc(animeOngoing!.title).set({
          'uid': currentUser.uid,
          'image_url': animeOngoing.imageUrl,
          'title': animeOngoing.title,
          'synopsis': animeOngoing.synopsis,
          'genre': animeOngoing.genre,
          'trailer': animeOngoing.trailer,
          'score': animeOngoing.score,
          'episode': animeOngoing.episode,
          'day': animeOngoing.day,
          'month': animeOngoing.month,
          'year': animeOngoing.year,
          'type': animeOngoing.type,
        });
        isAdded.value = true;
        Utilities.snackBar('Ditambahkan ke MyList', AppColor.primary);
      } else {
        await collection.doc(animeUpcoming!.title).set({
          'uid': currentUser.uid,
          'image_url': animeUpcoming.imageUrl,
          'title': animeUpcoming.title,
          'synopsis': animeUpcoming.synopsis,
          'genre': animeUpcoming.genre,
          'trailer': animeUpcoming.trailer,
          'score': animeUpcoming.score,
          'episode': animeUpcoming.episode,
          'type': animeUpcoming.type,
          'day': animeUpcoming.day,
          'month': animeUpcoming.month,
          'year': animeUpcoming.year,
        });
        isAdded.value = true;
        Utilities.snackBar('Ditambahkan ke MyList', AppColor.primary);
      }
    } catch (e) {
      print(e);
      Utilities.snackBar(e.toString(), AppColor.primary);
    }
  }

  void deleteMyList(MyList? mylist) async {
    try {
      await collection.doc(mylist!.title).delete();
      Utilities.snackBar('Dihapus dari MyList', AppColor.primary);
      Get.back();
    } catch (e) {
      print(e);
      Utilities.snackBar('Terjadi kesalahan', AppColor.error);
    }
  }
}
