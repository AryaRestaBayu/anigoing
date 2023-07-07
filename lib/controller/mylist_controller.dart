import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/services/utilities.dart';
import 'package:ani_going/services/variable.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyListController extends GetxController {
  var myList = RxList<MyList>([]);

  Stream<List<MyList>> getMyList() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('mylist')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => MyList.fromJson(doc.data())).toList());
  }

  Future<void> addMyList(
    bool isOngoing,
    AnimeOngoing? animeOngoing,
    AnimeUpcoming? animeUpcoming,
  ) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final collectionReference =
          FirebaseFirestore.instance.collection('users');
      final userDocument = collectionReference.doc(currentUser!.uid);
      final mylistCollection = userDocument.collection('mylist');

      if (isOngoing) {
        await mylistCollection.doc(animeOngoing!.title).set({
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
      } else {
        await mylistCollection.doc(animeUpcoming!.title).set({
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
      }
      Utilities.snackBar('Ditambahkan ke MyList', PColor.primary);
    } catch (e) {
      print(e);
      Utilities.snackBar(e.toString(), PColor.primary);
    }
  }
}
