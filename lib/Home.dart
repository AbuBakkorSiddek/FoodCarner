import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcorner/Review/ReviewCart.dart';
import 'package:foodcorner/Search/Search.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/productDetails.dart';
import 'package:foodcorner/widget/singleProduct.dart';

import 'myProfile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget listTile(
      {required IconData iconData,
      required String titletext,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        titletext,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 45,
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 42,
                      child: Image.asset('images/foodcorner.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To FoodCorner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 2),
                        ),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            listTile(
                iconData: Icons.home_outlined, titletext: 'Home', onTap: () {}),
            listTile(
                iconData: Icons.shop_outlined,
                titletext: 'Review Cart',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                }),
            listTile(
                iconData: Icons.person_outlined,
                titletext: 'My Profile',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myprofile()));
                }),
            listTile(
                iconData: Icons.notifications_outlined,
                titletext: 'Notification',
                onTap: () {}),
            listTile(
                iconData: Icons.star_border_outlined,
                titletext: 'Rating & Star',
                onTap: () {}),
            listTile(
                iconData: Icons.favorite_border_outlined,
                titletext: 'WishList',
                onTap: () {}),
            listTile(
                iconData: Icons.copy_outlined,
                titletext: 'Raise a Complaint',
                onTap: () {}),
            listTile(
                iconData: Icons.format_quote_outlined,
                titletext: 'FAQs',
                onTap: () {}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact Support',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Call Us :',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '01640382039 :',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [
                        Text(
                          'Mail Us : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'siddek7277@gmail.com',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffd6b738),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Color(0xffd4d181),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              },
              color: Colors.black,
              icon: Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.shop_outlined,
                size: 25,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.shutterstock.com/image-photo/composition-assorted-raw-organic-vegetables-'
                          '260nw-598749548.jpg'),
                      fit: BoxFit.cover),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 60),
                          child: Column(
                            children: [
                              Text(
                                '30% Off',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: Colors.white),
                              ),
                              Text(
                                'on all vegetable product',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Herbs Seasoning',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                    productText: 'Fresh Basil',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Akand leaves',
                                    productImage:
                                        'https://static-ai.asianetnews.com/images/01dz31myw9afh5dt2vtm36rz8s/untitled---2020-01-21t084230-004-jpg_1200x900xt.jpg',
                                  )));
                    },
                    productImage:
                        'https://static-ai.asianetnews.com/images/01dz31myw9afh5dt2vtm36rz8s/untitled---2020-01-21t084230-004-jpg_1200x900xt.jpg',
                    productText: 'Akand leaves',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuyqhLZJ8-j8S2gc5F6pcekFuyFWpvd2Zgw&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuyqhLZJ8-j8S2gc5F6pcekFuyFWpvd2Zgw&usqp=CAU',
                    productText: 'Fresh Basil',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'https://janatarsylhet24.com/wp-content/uploads/2020/08/pathorkuchi-230643.jpg',
                                  )));
                    },
                    productImage:
                        'https://janatarsylhet24.com/wp-content/uploads/2020/08/pathorkuchi-230643.jpg',
                    productText: 'Fresh Basil',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Green Apple',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpMqaUDGM1n8h8zJbrgpW7Ti7U8dI4-Df8gg&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpMqaUDGM1n8h8zJbrgpW7Ti7U8dI4-Df8gg&usqp=CAU',
                    productText: 'Green Apple',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Orange',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQd6SxTP2sg_NR8UXrUVOAMbAjgl6qG4UfaRfE7unygI5OQFIKq4QO7iyyqs5UDf7werY&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQd6SxTP2sg_NR8UXrUVOAMbAjgl6qG4UfaRfE7unygI5OQFIKq4QO7iyyqs5UDf7werY&usqp=CAU',
                    productText: 'Fresh Orange',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                    productText: 'Fresh Basil',
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Vegitabel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Green Cabbage',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeJTsj5XObl3ZiK0-eg937nOFg-53cy7edmm1HyKbTvplLEtNDUcqr6_8Z-d6lnqkWs8o&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeJTsj5XObl3ZiK0-eg937nOFg-53cy7edmm1HyKbTvplLEtNDUcqr6_8Z-d6lnqkWs8o&usqp=CAU',
                    productText: 'Green Cabbage',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Green Leaves',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpKtSoCKcF7CBDFiFSdHCgHhdHTzabEiYVYg&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpKtSoCKcF7CBDFiFSdHCgHhdHTzabEiYVYg&usqp=CAU',
                    productText: 'Green Leaves',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                    productText: 'Fresh Basil',
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Cambo Pack',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq7DdxpzQb8L7ORQzkod8okKO_ttzAm34MxQ&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq7DdxpzQb8L7ORQzkod8okKO_ttzAm34MxQ&usqp=CAU',
                    productText: 'Fruits',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcdsrZjvIRtP-nQHA4ykoKmkRY09CmBI-BDg&usqp=CAU',
                                  )));
                    },
                    productImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcdsrZjvIRtP-nQHA4ykoKmkRY09CmBI-BDg&usqp=CAU',
                    productText: 'Fresh Basil',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Basil',
                                    productImage:
                                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                    productText: 'Fresh Basil',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
