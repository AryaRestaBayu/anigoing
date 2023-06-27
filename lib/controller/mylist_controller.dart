import 'package:ani_going/model/mylist_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyListController extends GetxController {
  var myList = <MyList>[].obs;
  String uid;

  MyListController({required this.uid});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyList();
  }

  getMyList() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid) //yang ingin saya ubah
          .collection('mylist')
          .get();
      myList.value =
          snapshot.docs.map((doc) => MyList.fromJson(doc.data())).toList();
      print('sukses');
      update();
    } catch (e) {
      print(e);
    }
  }
}
