// ignore_for_file: avoid_print
import 'package:beauty_spa/models/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
      throw (error);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String birthday,
      required String fullName,
      required String phoneNumber}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await createUserDataDocument(
          email: email,
          fullName: fullName,
          birthday: birthday,
          phoneNumber: phoneNumber);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      try {
        _firebaseAuth.signOut();
      } catch (error) {
        rethrow;
      }
    }
  }

  Future<void> createUserDataDocument(
      {required String email,
      required String birthday,
      required String fullName,
      required String phoneNumber}) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);

      final customerData = Customer(
          id: currentUser!.uid,
          email: email,
          birthday: birthday,
          fullName: fullName,
          phoneNumber: phoneNumber);
      final customerJson = customerData.toJson();

      await docUser.set(customerJson);
    } catch (error) {
      rethrow;
    }
  }

  
}
