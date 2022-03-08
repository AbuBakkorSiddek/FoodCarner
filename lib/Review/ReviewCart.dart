import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/cartReviewProvider.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/model/ReviewCartModel.dart';
import 'package:foodcorner/widget/SingleItem.dart';
import 'package:provider/provider.dart';


class ReviewCart extends StatelessWidget {



   late ReviewCartProvider  reviewCartProvider;





   showAlertDialog(BuildContext context,ReviewCartModel delete) {

     // set up the buttons
     Widget cancelButton = TextButton(
       child: Text("No"),
       onPressed:  () {

         Navigator.of(context).pop();

       },
     );
     Widget continueButton = TextButton(
       child: Text("Yes"),
       onPressed:  () {

          reviewCartProvider.reviewCartDelete(delete.cartId);
         Navigator.of(context).pop();

       },
     );

     // set up the AlertDialog
     AlertDialog alert = AlertDialog(
       title: Text("Cart Product"),
       content: Text("Are you sure delete on Product?"),
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
     reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(

        title: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
        subtitle: Text('170 TK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        trailing: Container(
          width: 160,
          child: MaterialButton(onPressed: () {  },
          child: Text('Subnet'),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),),
        ),

      ),
      appBar: AppBar(title: Text('Review Cart',),
      backgroundColor: primaryColor ,),
      body:  reviewCartProvider.getReviewCartDataList.isEmpty?Center(
        child:Text('NO DATA'),) : ListView.builder(
          itemCount: reviewCartProvider.getReviewCartDataList.length,
          itemBuilder: (context,  index) {
            ReviewCartModel data =
            reviewCartProvider.getReviewCartDataList[index];
            return Column(
             children: [

               SizedBox(height: 10,),

               SingleItem(isBool: true,
                 productImage: data.cartImage,
                 productName: data.cartName,
                 productPrice: data.cartPrice,
                 productId: data.cartId,
                 productQuantity: data.cartQuantity,
                 onDelete: () {

                   showAlertDialog(context,data) ;

                 },),

             ]
            );
          },

        ),
    );
  }
}
