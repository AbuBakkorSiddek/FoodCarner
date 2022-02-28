import 'package:flutter/material.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/widget/SingleItem.dart';

class ReviewCart extends StatelessWidget {

   ReviewCart({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(

        title: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
        subtitle: Text('170 TK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        trailing: Container(
          width: 160,
          child: MaterialButton(onPressed: () {  },
          child: Text('Submet'),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),),
        ),

      ),
      appBar: AppBar(title: Text('Review Cart',),
      backgroundColor: primaryColor ,),
      body: ListView(
        children: [

          SizedBox(height: 10,),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
