import 'package:beauty_spa/models/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUD {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  late Customer currentCustomer;

  Stream<DocumentSnapshot<Map<String, dynamic>>> readCustomerData() {
    print(currentUser!.uid);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .snapshots();
  }
}
