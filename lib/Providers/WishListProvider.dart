import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{


  void addWishListData({
    required String? wishListId,
    required String? wishListName,
    required String? wishListImage,
    required int? wishListPrice,
    required int? wishListQuantity,


  }) async {
    FirebaseFirestore.instance
        .collection("WistList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("CustomerWistList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList":true,
      },
    );
  }


}