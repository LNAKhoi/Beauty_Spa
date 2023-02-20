// ignore_for_file: avoid_print
import 'package:beauty_spa/models/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      try {
        _firebaseAuth.signOut();
      } catch (error) {
        print(error);
      }
    }
  }

  Future<void> createUserDataDocument(
      {required String email,
      required String birthday,
      required String fullName}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final customerData = Customer(
        id: docUser.id, email: email, birthday: birthday, fullName: fullName);
    final customerJson = customerData.toJson();

    await docUser.set(customerJson);
  }
}
