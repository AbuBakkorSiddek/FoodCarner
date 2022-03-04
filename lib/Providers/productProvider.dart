import 'package:flutter/foundation.dart';

import '../model/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  late ProductModel productModel;

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
}
