import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/WishListProvider.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/model/ProductModel.dart';
import 'package:foodcorner/widget/SingleItem.dart';
import 'package:provider/provider.dart';


class myWishList extends StatefulWidget {
  const myWishList({Key? key}) : super(key: key);

  @override
  State<myWishList> createState() => _myWishListState();
}

class _myWishListState extends State<myWishList> {

  late WishListProvider wishListProvider;

  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you devete on wishList Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();


    return Scaffold(
      appBar: AppBar(title: Text('WishList',),
        backgroundColor: primaryColor ,),
      body:ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context,  index) {
          ProductModel data =
          wishListProvider.getWishList[index];
          return Column(
              children: [

                SizedBox(height: 10,),

                SingleItem(
                  wishListBool : false,
                  isBool: true,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productId: data.productId,
                  productQuantity: data.productQuantity ,
                  onDelete: () {

                    showAlertDialog(context,data);

                  },),

              ]
          );
        },

      ),
    );
  }
}
