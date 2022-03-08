import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/WishListProvider.dart';
import 'package:foodcorner/Providers/cartReviewProvider.dart';
import 'package:foodcorner/Providers/productProvider.dart';
import 'package:foodcorner/Providers/userProvider.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/slashScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [

            ChangeNotifierProvider<ProductProvider>(
            create: (context)=>ProductProvider(),),

            ChangeNotifierProvider<UserProvider>(
            create: (context)=>UserProvider(),),

            ChangeNotifierProvider<ReviewCartProvider>(
            create: (context)=>ReviewCartProvider(),),

            ChangeNotifierProvider<WishListProvider>(
            create: (context)=>WishListProvider(),),

        ],
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: scaffoldBackgroundColor
          ),
          home: const SlashScreen(),
        ),

    );

  }
}


