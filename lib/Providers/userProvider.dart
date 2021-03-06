import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    User? currentUser,
    String? userName,
    String? userImage,
    String? userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser?.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser?.uid,
      },
    );
  }

}