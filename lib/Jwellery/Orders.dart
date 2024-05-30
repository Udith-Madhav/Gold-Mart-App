import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: screenWidth-150,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    
                    Container(
                      width: screenWidth-150,
                      height: screenHeight/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10,),

                              Text(
                                'userID :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'OrderID :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'jwelleryID :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'paymentID :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'Date :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}