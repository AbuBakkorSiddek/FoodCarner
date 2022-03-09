import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/WishListProvider.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum SinginCharacter { fill, outline }

class ProductDetails extends StatefulWidget {

  final String productId;
  final String productName;
  final String productImage;
  final int productPrice;




  ProductDetails({Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,})
      :super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  SinginCharacter _character = SinginCharacter.fill;

  bool wishListBoll=false;

  getwishListBool(){

    FirebaseFirestore.instance
        .collection("WistList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("CustomerWistList")
        .doc(widget.productId)
        .get()
        .then((value) => {

    if(this.mounted){

        setState(() {

      wishListBoll=value.get("WistList");

    })

  }

    });
    
  }

  @override
  Widget build(BuildContext context) {

    WishListProvider wishListProvider=Provider.of(context);

    getwishListBool();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Details',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Row(children: [
        Expanded(
          child: Material(
            color: Colors.deepOrangeAccent,
            child: InkWell(
              onTap: () {
                //print('called on tap');

                setState(() {

                  wishListBoll=!wishListBoll;

                });

                if(wishListBoll==true){

                  wishListProvider.addWishListData(
                      wishListId: widget.productId,
                      wishListName: widget.productName,
                      wishListImage: widget.productImage,
                      wishListPrice: widget.productPrice,
                      wishListQuantity: 2
                  );

                 }else{
                  wishListProvider.deleteWishtList(widget.productId);
                }


              },
              child: SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    wishListBoll==false?Icon(Icons.favorite_border_outlined):Icon(Icons.favorite,color: Colors.green,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add To WishList',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.amberAccent,
            child: InkWell(
              onTap: () {
                //print('called on tap');
              },
              child: SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shop_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\ ${widget.productPrice}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 200,
                      margin: EdgeInsets.all(40),
                      child: Center(
                        child: Image.network(widget.productImage),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Available Option',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio<SinginCharacter>(
                              activeColor: Colors.green[700],
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            )
                          ],
                        ),
                        Text(
                          '50Taka',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: primaryColor,
                              ),
                              Text('ADD',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
