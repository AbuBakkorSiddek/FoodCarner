import 'package:flutter/foundation.dart';

import '../model/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductProvider with ChangeNotifier {
  List<ProductModel> HerbsProductList = [];
  late ProductModel productModel;

  fatchHerbusProductData() async {

    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbusProduct').get();

    value.docs.forEach((element) {

      productModel =
          ProductModel(
              ProductImage: element.get('productImage'),
              productName: element.get('productName'),
            ProductPrice: element.get('productPrice')
          
          );
      
      newList.add(productModel);
      
    }
    );

    HerbsProductList=newList;
    notifyListeners();

  }

 List<ProductModel> get getHerbsProductDetailsList{
    return HerbsProductList;
  }
}
