import 'package:flutter/material.dart';
import 'package:foodcorner/widget/CustomTextField.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {


  final GlobalKey<FormState> fromkey=GlobalKey<FormState>();


  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


                
                  Image.asset('images/foodcornericon.png'),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      autofocus: false,
                      controller: email,
                      hintText: 'email',
                      labelText: 'email',
                      prifixicon: Icon(Icons.email_outlined),
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value))
                        {
                          return ("Please Enter a valid Email");
                        }
                        return null;
                      },

                    ),
                  ),

                  

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      autofocus: false,
                      controller: password,
                     // obscuretext: !passhide,
                      textInputAction: TextInputAction.next,
                      hintText: 'Password',
                      labelText: 'Password',
                      prifixicon: Icon(Icons.lock_clock_outlined),
                      // sufixicon:IconButton(
                      //   onPressed: (){
                      //     PasswordShowHide();
                      //   },
                      //   icon:passhide?Icon(Icons.visibility):Icon(Icons.visibility_off),
                      // ),
                      validator: (value) {
                        RegExp regExp = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter Your Password");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Please Enter valid password(Min.6 Character)");
                        }
                      },


                    ),
                  ),

                  SizedBox(height: 20,),



                  


          ],
        ),
      ),
    );
  }
}
