import 'package:flutter/material.dart';
import 'package:foodcorner/widget/SingleItem.dart';
import 'package:foodcorner/color/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: primaryColor,
        actions: [Icon(Icons.menu_rounded)],
      ),
      body: ListView(
        children: [

          ListTile(
            title: Text('Items'),
          ),


          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none
                ),
                fillColor:Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for items in Store',
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          SizedBox(height: 10,),


          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),


        ],
      ),
    );
  }
}
