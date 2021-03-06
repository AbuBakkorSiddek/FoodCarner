import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/productProvider.dart';
import 'package:foodcorner/Review/ReviewCart.dart';
import 'package:foodcorner/Search/Search.dart';
import 'package:foodcorner/WishList/wishList.dart';
import 'package:foodcorner/color/colors.dart';
import 'package:foodcorner/productDetails.dart';
import 'package:foodcorner/widget/singleProduct.dart';
import 'package:provider/provider.dart';
import 'myProfile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductProvider productProvider;

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
  void initState() {
    productProvider = Provider.of(context, listen: false);
    productProvider.fatchHerbusProductData();
    productProvider.fatchFruitssProductData();
    productProvider.fatchVegitabelProductData();
    productProvider.fatchOilProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);

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
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myWishList()));

                }),
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
                        '01640382039 ',
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
                    context, MaterialPageRoute(builder: (context) => Search(search: [],)));
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(
                                search: productProvider.getHerbsProductDetailsList,
                              )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getHerbsProductDetailsList
                    .map((herbsProductDetails) {
                  return singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productName:
                                        herbsProductDetails.productName,
                                    productImage:
                                        herbsProductDetails.productImage,
                                    productPrice:
                                        herbsProductDetails.productPrice,
                                   productId:
                                       herbsProductDetails.productId,

                                  )));
                    },
                    productImage: herbsProductDetails.productImage,
                    productText: herbsProductDetails.productName,
                    productPrice: herbsProductDetails.productPrice,
                    productId: herbsProductDetails.productId,
                  );
                }).toList(),
              ),
            ),

            // 'Fresh Fruits',

            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(
                            search: productProvider.getFruitsProductDetailsList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getFruitsProductDetailsList
                    .map((fruitsProductDetails) {
                  return singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productName:
                                        fruitsProductDetails.productName,
                                    productImage:
                                        fruitsProductDetails.productImage,
                                    productPrice:
                                        fruitsProductDetails.productPrice,
                                productId:
                                        fruitsProductDetails.productId,
                                  )));
                    },
                    productImage: fruitsProductDetails.productImage,
                    productText: fruitsProductDetails.productName,
                    productPrice: fruitsProductDetails.productPrice,
                    productId: fruitsProductDetails.productId,
                  );
                }).toList(),
              ),
            ),

            // 'Vegitabel',

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Vegitabel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(
                            search: productProvider.getVegitabelProductDetailsList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getVegitabelProductDetailsList
                    .map((vegitabelProductDetails) {
                  return singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productName:
                                        vegitabelProductDetails.productName,
                                    productImage:
                                        vegitabelProductDetails.productImage,
                                    productPrice:
                                        vegitabelProductDetails.productPrice,
                                productId:  vegitabelProductDetails.productId,
                                  )));
                    },
                    productImage: vegitabelProductDetails.productImage,
                    productText: vegitabelProductDetails.productName,
                    productPrice: vegitabelProductDetails.productPrice,
                    productId: vegitabelProductDetails.productId,
                  );
                }).toList(),
              ),
            ),

            // 'Cambo Pack',

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Oil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(
                            search: productProvider.getOilProductDetailsList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getOilProductDetailsList
                    .map((oilProductDetails) {
                  return singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productName: oilProductDetails.productName,
                                    productImage:
                                        oilProductDetails.productImage,
                                    productPrice:
                                        oilProductDetails.productPrice,
                                   productId: oilProductDetails.productId,
                                  )));
                    },
                    productImage: oilProductDetails.productImage,
                    productText: oilProductDetails.productName,
                    productPrice: oilProductDetails.productPrice,
                    productId: oilProductDetails.productId,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
