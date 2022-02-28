import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffd6b738),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
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
            SizedBox(height: 5,),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
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

            SizedBox(height: 5,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                  singelProduct(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class singelProduct extends StatelessWidget {
  const singelProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 180,
      height: 260,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                  'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fresh Basil',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '50 TK / 50 Gram',
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        width: 50,
                        height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5),
                              child: Row(children: [

                               Text('50 Gram'),
                                Icon(Icons.arrow_drop_down,color: Colors.amberAccent,)

                              ],),
                            ),
                      )),

                      SizedBox(width: 5,),
                      Expanded(
                          child: Container(
                        width: 50,
                        height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(Icons.remove,color: Colors.amberAccent),
                                Text('1'),
                                Icon(Icons.add,color: Colors.amberAccent),


                              ],
                            ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
