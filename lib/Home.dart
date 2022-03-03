import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcorner/Providers/productProvider.dart';
import 'package:foodcorner/Review/ReviewCart.dart';
import 'package:foodcorner/Search/Search.dart';
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

   productProvider=Provider.of(context,listen: false);
    productProvider.fatchHerbusProductData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    productProvider=Provider.of(context);

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
                                  productText: 'Fresh Mnit',
                                  productImage:
                                      "https://www.freepnglogos.com/uploads/mint-png/mint-png-images-are-download-crazypngm-10.png")));
                    },
                    productImage:
                        "https://www.freepnglogos.com/uploads/mint-png/mint-png-images-are-download-crazypngm-10.png",
                    productText: 'Fresh Mnit',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Rose Merry',
                                  productImage:
                                      "http://assets.stickpng.com/thumbs/58bf1e41e443f41d77c734ae.png")));
                    },
                    productImage:
                      "http://assets.stickpng.com/thumbs/58bf1e41e443f41d77c734ae.png",
                    productText: 'Rose Merry',
                  ),

                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Thyme',
                                  productImage:
                                  "http://assets.stickpng.com/thumbs/58bf1e33e443f41d77c734ac.png")));
                    },
                    productImage:
                    "http://assets.stickpng.com/thumbs/58bf1e33e443f41d77c734ac.png",
                    productText: 'Thyme',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Sage',
                                  productImage:
                                  "http://assets.stickpng.com/thumbs/58bf1e48e443f41d77c734af.png")));
                    },
                    productImage:
                    "http://assets.stickpng.com/thumbs/58bf1e48e443f41d77c734af.png",
                    productText: 'Sage',
                  ),




                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Lovage',
                                  productImage:
                                  "http://assets.stickpng.com/thumbs/58bf1e6ce443f41d77c734b3.png")));
                    },
                    productImage:
                    "http://assets.stickpng.com/thumbs/58bf1e6ce443f41d77c734b3.png",
                    productText: 'Lovage',
                  ),






                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Oregano',
                                  productImage:
                                  "http://assets.stickpng.com/thumbs/58bf1e57e443f41d77c734b1.png")));
                    },
                    productImage:
                    "http://assets.stickpng.com/thumbs/58bf1e57e443f41d77c734b1.png",
                    productText: 'Oregano',
                  ),




                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  productText: 'Bay Leaf',
                                  productImage:
                                  "http://assets.stickpng.com/thumbs/58bf1ea3e443f41d77c734b9.png")));
                    },
                    productImage:
                    "http://assets.stickpng.com/thumbs/58bf1ea3e443f41d77c734b9.png",
                    productText: 'Bay Leaf',
                  ),


                ],
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
                                    productText: 'Passion Fruit',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5a60afe4eace967f8e026a18.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5a60afe4eace967f8e026a18.png',
                    productText: 'Passion Fruit',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Sliced Dragon Fruit',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5a5f62a2ee40df432bfac559.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5a5f62a2ee40df432bfac559.png',
                    productText: 'Sliced Dragon Fruit',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Fresh Lychee Fruit',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5a5f615dee40df432bfac53b.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5a5f615dee40df432bfac53b.png',
                    productText: 'Fresh Lychee Fruit',
                  ),

                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Whole Santol Fruit',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f638dee40df432bfac56d.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f638dee40df432bfac56d.png',
                    productText: 'Whole Santol Fruit',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Fresh Kumquat',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f614bee40df432bfac539.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f614bee40df432bfac539.png',
                    productText: 'Fresh Kumquat',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Whole Bread Fruit',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f6335ee40df432bfac566.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f6335ee40df432bfac566.png',
                    productText: 'Whole Bread Fruit',
                  ),




                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Whole Kaki Fruit',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a60b066eace967f8e026a21.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a60b066eace967f8e026a21.png',
                    productText: 'Whole Kaki Fruit',
                  ),




                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Water Apple',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f632aee40df432bfac565.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f632aee40df432bfac565.png',
                    productText: 'Water Apple',
                  ),




                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Large Jackfruit',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f61f8ee40df432bfac54a.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f61f8ee40df432bfac54a.png',
                    productText: 'Large Jackfruit',
                  ),





                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Durian',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5a5f6131ee40df432bfac536.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5a5f6131ee40df432bfac536.png',
                    productText: 'Durian',
                  ),


                ],
              ),
            ),


            // 'Vegitabel',

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
                                    productText: 'Celeriac',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/585ea843cb11b227491c3547.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/585ea843cb11b227491c3547.png',
                    productText: 'Celeriac',
                  ),
                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Bitter Melon',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5ae22eb633b73fa43b1a894c.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5ae22eb633b73fa43b1a894c.png',
                    productText: 'Bitter Melon',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Zucchini',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/585ea830cb11b227491c3544.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/585ea830cb11b227491c3544.png',
                    productText: 'Zucchini',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Buk Choy',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5ae22ecc33b73fa43b1a894e.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5ae22ecc33b73fa43b1a894e.png',
                    productText: 'Buk Choy',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Romanesco Broccoli',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5ae22f4833b73fa43b1a8957.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5ae22f4833b73fa43b1a8957.png',
                    productText: 'Romanesco Broccoli',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Spinach',
                                productImage:
                                'http://assets.stickpng.com/thumbs/585ea80acb11b227491c353e.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/585ea80acb11b227491c353e.png',
                    productText: 'Spinach',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Radishes',
                                productImage:
                                'http://assets.stickpng.com/thumbs/585ea83dcb11b227491c3546.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/585ea83dcb11b227491c3546.png',
                    productText: 'Radishes',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Asparagus',
                                productImage:
                                'http://assets.stickpng.com/thumbs/585ea851cb11b227491c3549.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/585ea851cb11b227491c3549.png',
                    productText: 'Asparagus',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'En Choy',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5ae22ef033b73fa43b1a8951.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5ae22ef033b73fa43b1a8951.png',
                    productText: 'En Choy',
                  ),


                ],
              ),
            ),


            // 'Cambo Pack',

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Oil',
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
                                    productText: 'Lavender Oil',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/596cdf07ed07ad6118f998e1.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/596cdf07ed07ad6118f998e1.png',
                    productText: 'Lavender Oil',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'White Truffle Oil',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5c091ef22c6641059597e3b7.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5c091ef22c6641059597e3b7.png',
                    productText: 'White Truffle Oil',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    productText: 'Black Truffle Oil',
                                    productImage:
                                        'http://assets.stickpng.com/thumbs/5c091e2b2c6641059597e3a4.png',
                                  )));
                    },
                    productImage:
                        'http://assets.stickpng.com/thumbs/5c091e2b2c6641059597e3a4.png',
                    productText: 'Black Truffle Oil',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Peppermint Oil',
                                productImage:
                                'http://assets.stickpng.com/thumbs/5c8b79decdad6d02b006e4b4.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/5c8b79decdad6d02b006e4b4.png',
                    productText: 'Peppermint Oil',
                  ),


                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Royal Oils Lavender',
                                productImage:
                                'http://assets.stickpng.com/thumbs/596cdfb3ed07ad6118f998e7.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/596cdfb3ed07ad6118f998e7.png',
                    productText: 'Royal Oils Lavender',
                  ),



                  singelProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productText: 'Young Living Oil',
                                productImage:
                                'http://assets.stickpng.com/thumbs/596cdf1aed07ad6118f998e2.png',
                              )));
                    },
                    productImage:
                    'http://assets.stickpng.com/thumbs/596cdf1aed07ad6118f998e2.png',
                    productText: 'Young Living Oil',
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
