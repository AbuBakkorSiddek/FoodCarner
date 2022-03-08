import 'package:flutter/material.dart';
import '../Providers/cartReviewProvider.dart';
import '../color/colors.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingProductCount extends StatefulWidget {
  String productName;
  String productImage;
  int productPrice;
  String productId;

  SingProductCount({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
  }) : super(key: key);

  @override
  State<SingProductCount> createState() => _SingProductCountState();
}

class _SingProductCountState extends State<SingProductCount> {
  late ReviewCartProvider reviewCartProvider;

  int count = 1;
  bool istrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count=value.get( "cartQuantity");
                        istrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {


    getAddAndQuantity();

    reviewCartProvider = Provider.of(context);

    return Expanded(
        child: Container(
            width: 30,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10.0)),
            child: istrue == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            if (count == 1) {
                              setState(() {
                                istrue = false;
                              });
                              reviewCartProvider.reviewCartDelete(widget.productId);
                            } else if(count >1){
                              setState(() {
                                count--;
                              });

                              reviewCartProvider.updateReviewCartData(
                                cartId: widget.productId,
                                cartImage: widget.productImage,
                                cartName: widget.productName,
                                cartPrice: widget.productPrice,
                                cartQuantity: count,

                              );

                            }

                          },
                          child: Icon(Icons.remove, color: Colors.amberAccent)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$count"),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                            reviewCartProvider.updateReviewCartData(
                              cartId: widget.productId,
                              cartImage: widget.productImage,
                              cartName: widget.productName,
                              cartPrice: widget.productPrice,
                              cartQuantity: count,
                            );
                          },
                          child: Icon(Icons.add, color: Colors.amberAccent)),
                    ],
                  )
                : Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          istrue = true;
                        });
                        reviewCartProvider.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                        );
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )));
  }
}
