import 'package:flutter/material.dart';
import '../Providers/cartReviewProvider.dart';
import '../color/colors.dart';
import 'package:provider/provider.dart';

class SingProductCount extends StatefulWidget {

  String productName;
  String productImage;
  int productPrice;
  String productId;

   SingProductCount({Key? key,
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

  int count=1;
  bool istrue =false;

  @override
  Widget build(BuildContext context) {

    reviewCartProvider =Provider.of(context);

    return  Expanded(
        child: Container(
          width: 30,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.circular(10.0)),
          child: istrue==true?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){

                    if(count==1){

                      setState(() {
                        istrue=false;
                      });

                    }else{

                      setState(() {
                        count--;
                      });

                    }

                  },
                  child: Icon(Icons.remove, color: Colors.amberAccent)),
              SizedBox(width: 5,),
              Text("$count"),
              SizedBox(width: 5,),
              InkWell(
                  onTap: (){

                    setState(() {

                      count++;

                    });
                    reviewCartProvider.addReviewCartData(
                        cartId: widget.productId ,
                        cartImage:widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,

                    );

                  },
                  child: Icon(Icons.add, color: Colors.amberAccent)),
            ],
          ):Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  istrue=true;
                });
              },
              child: Text('ADD',style: TextStyle(color: primaryColor),),
            ),
          )
        )
    );
  }
}
