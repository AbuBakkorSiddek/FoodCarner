import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({
    Key? key,
    required this.isBool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(
                  child: Image.network(
                      'http://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png'),
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: isBool == false
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ProductName',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('50 Taka/50 Gram',
                            style: TextStyle(color: Colors.grey, fontSize: 15))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    isBool == false
                        ? Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey, width: 2)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '50 Gram',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Center(
                                  child: Icon(Icons.arrow_drop_down),
                                )
                              ],
                            ),
                          )
                        : Text('50 Gram')
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                padding: isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 30)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isBool == false
                    ? Container(
                        height: 50,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            Text('ADD',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black,
                          ),Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Colors.grey,width: 2
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,size: 20,),
                                SizedBox(width: 5,),
                                Text('ADD',style: TextStyle(fontWeight: FontWeight.bold))
                              ],),
                          )
                        ],
                      ),

              )),

            ],
          ),
        ),
        isBool==false ?Container():Divider(color: Colors.grey,height: 2,
        thickness: 1,)
      ],
    );
  }
}
