import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodcorner/model/ProductModel.dart';

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



  /////////Get WishList Data/////////

  List<ProductModel> wishList=[];

  getWishListData()async{

    List<ProductModel> newList=[];

    QuerySnapshot value =await FirebaseFirestore.instance
        .collection("WistList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("CustomerWistList")
        .get();

    value.docs.forEach((element) {

      ProductModel productModel=ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),
        productQuantity: element.get("wishListQuantity"),

      );

       newList.add(productModel);

    });

    wishList=newList;

    notifyListeners();


  }

  List<ProductModel> get getWishList{

    return wishList;

  }


  ///////deleteWishList////////


  deleteWishtList(wishListId){

    FirebaseFirestore.instance
        .collection("WistList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("CustomerWistList")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }


}