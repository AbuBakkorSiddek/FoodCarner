import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodcorner/auth/EmailORGmail.dart';
import 'package:foodcorner/auth/singIn.dart';
class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  _SlashScreenState createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailOrGmail())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
          Image.asset('images/foodcorner.png')
          
        ],
      ),
    );
  }
}
