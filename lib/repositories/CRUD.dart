import 'package:beauty_spa/models/customer.dart';
import 'package:beauty_spa/models/salon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/home_screen/home_screen.dart';

class Crud {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<DocumentSnapshot<Map<String, dynamic>>> readCustomerData() {
    print(currentUser!.uid);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .snapshots();
  }

  Future<Customer> retrieveUser() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
    if (!documentSnapshot.exists) {
      throw Exception();
    }

    return Customer.fromJson(documentSnapshot.data()!);
  }

  Future<List<String>> retrieveSalonImages() async {
    List<String> salonImageList = [];
    var docSnapshot =
        await FirebaseFirestore.instance.collection('salon').get();
    if (docSnapshot.size != 0) {
     // print("!= 0");
      for (var item in docSnapshot.docs) {
        Map<String, dynamic> data = item.data();
        salonImageList.add(data['image_source']);
      }
    }
   // print(salonImageList.length);
    return salonImageList;
  }
}
