import 'package:ani_going/model/mylist_model.dart';
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
}
