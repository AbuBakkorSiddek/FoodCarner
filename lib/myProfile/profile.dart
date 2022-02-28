import 'package:flutter/material.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/myProfile/listTile.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'My Profile',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: primaryColor,
              ),
              Container(
                height: 616,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 280,
                          height: 100,
                         margin: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ABU BAKKOR SIDDEK',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 5,),
                                    Text('siddek7277@gmail.com',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                  ],
                                ),


                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: scaffoldBackgroundColor,
                                    child: Icon(Icons.edit,color: primaryColor,),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),

                    ProfileListTile(iconData: Icons.shop_outlined,title:'My Orders',),
                    ProfileListTile(iconData: Icons.location_on_outlined,title:'My Delivery Address',),
                    ProfileListTile(iconData: Icons.person_outline,title:'Refer a Friend',),
                    ProfileListTile(iconData: Icons.file_copy_outlined,title:'Terms & Condition',),
                    ProfileListTile(iconData: Icons.policy_outlined,title:'Privacy & Policy',),
                    ProfileListTile(iconData: Icons.add_chart_outlined,title:'About',),
                    ProfileListTile(iconData: Icons.exit_to_app_outlined,title:'Log Out',),

                  ],
                ),
              )
            ],
          ),

          //CircleAvatar
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 70),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 52,
                child: Image.asset('images/foodcornericon.png'),
                backgroundColor: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}


