import 'package:flutter/material.dart';
import '../model/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductProvider with ChangeNotifier {

  late ProductModel productModel;


  /////////////////////HerbusProduct////////////

  List<ProductModel> herbsProductList = [];

  fatchHerbusProductData() async {

    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbusProduct').get();

    value.docs.forEach((element) {

      productModel =
          ProductModel(
              productImage: element.get('productImage'),
              productName: element.get('productName'),
              productPrice: element.get('productPrice'),
              productId:element.get('productId'),

          );
      
      newList.add(productModel);
      
    },
    );

    herbsProductList=newList;
    notifyListeners();

  }

 List<ProductModel> get getHerbsProductDetailsList{
    return herbsProductList;
  }



/////////////////////FruitsProduct////////////

  List<ProductModel> fruitsProductList = [];

  fatchFruitssProductData() async {

    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection('FruitsProduct').get();

    value.docs.forEach((element) {

      productModel =
          ProductModel(
            productImage: element.get('productImage'),
            productName: element.get('productName'),
            productPrice: element.get('productPrice'),
            productId:element.get('productId'),

          );

      newList.add(productModel);

    },
    );

    fruitsProductList=newList;
    notifyListeners();

  }

  List<ProductModel> get getFruitsProductDetailsList{
    return fruitsProductList;
  }


/////////////////////VegitabelProduct////////////



  List<ProductModel>vegitabelProductList = [];

  fatchVegitabelProductData() async {

    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection('VegitabelProduct').get();

    value.docs.forEach((element) {

      productModel =
          ProductModel(
            productImage: element.get('productImage'),
            productName: element.get('productName'),
            productPrice: element.get('productPrice'),
            productId:element.get('productId'),

          );

      newList.add(productModel);

    },
    );

    vegitabelProductList=newList;
    notifyListeners();

  }

  List<ProductModel> get getVegitabelProductDetailsList{
    return vegitabelProductList;
  }


/////////////////////OilProduct////////////



  List<ProductModel>oilProductList = [];

  fatchOilProductData() async {

    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection('OilProduct').get();

    value.docs.forEach((element) {

      productModel =
          ProductModel(
            productImage: element.get('productImage'),
            productName: element.get('productName'),
            productPrice: element.get('productPrice'),
            productId:element.get('productId'),

          );

      newList.add(productModel);

    },
    );

    oilProductList=newList;
    notifyListeners();

  }

  List<ProductModel> get getOilProductDetailsList{
    return oilProductList;
  }







}
