import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {

  final IconData iconData;
  final String title;


  const ProfileListTile({
    Key? key, required this.iconData, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Divider(height: 2,thickness: 2,),

        ListTile(leading: Icon(iconData),
          title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        )


      ],
    );
  }
}