import 'package:flutter/material.dart';
import 'package:foodcorner/Home.dart';
import 'package:foodcorner/Providers/userProvider.dart';
import 'package:foodcorner/auth/singIn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class EmailOrGmail extends StatefulWidget {
  const EmailOrGmail({Key? key}) : super(key: key);

  @override
  _EmailOrGmailState createState() => _EmailOrGmailState();
}

class _EmailOrGmailState extends State<EmailOrGmail> {


  late UserProvider userProvider;


  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

//store Data firestore
      userProvider.addUserData(currentUser: user, userName:user?.displayName, userEmail: user?.email, userImage: user?.photoURL);

      return user;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {

    userProvider=Provider.of(context);

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
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SingIn()));
              },
              child: Text('Sing In')),
          SignInButton(
            Buttons.Google,
            text: "Sign in with Google",
            onPressed: () {
              _googleSignUp().then((value) => Navigator.of(context)
                  .pushReplacement(
                      MaterialPageRoute(builder: (context) => Home())));
            },
          ),
        ],
      ),
    ));
  }
}
