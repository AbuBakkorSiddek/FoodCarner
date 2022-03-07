import 'package:flutter/material.dart';
import 'package:foodcorner/widget/singleProuductCount.dart';

class singelProduct extends StatelessWidget {

  final String productText;
  final String productImage;
  final String productId;
  final int productPrice;
  final Function() onTap;

  const singelProduct({
    Key? key,
    required this.productText,
    required this.productImage,
    required this.onTap,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      height: 270,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 170,
              width: double.infinity,
              child: Expanded(
                  flex: 2,
                  child: Image.network(productImage)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productText,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${productPrice}TK / 50 Gram',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 2),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('50 Gram'),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.amberAccent,
                                  )
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      SingProductCount(
                        productId: productId,
                        productName:productText,
                        productImage:productImage ,
                        productPrice: productPrice,


                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


