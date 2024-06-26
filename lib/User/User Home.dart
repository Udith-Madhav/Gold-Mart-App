// ignore_for_file: unused_local_variable, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userhome extends StatefulWidget {
  const Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth,
                    height: 76,
                    color: Color(0xFFD9D9D9),
                  ),
              
                  SizedBox(height: 20,),
                      
                  Container(
                    width: 305,
                    height: 203,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                      
                  SizedBox(height: 10,),
                      
                  Container(
                    width: 305,
                    height: 203,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Sell',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
              
                  Container(
                    width: screenWidth,
                    height: 68,
                    color: Colors.white,
                  
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth/2,
                          height: 68,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Userhome()));
                                }, 
                                icon: Icon(Icons.home,color: Colors.black,),
                              ),
                              
                              Text(
                                'Home',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                  
                        Container(
                          width: screenWidth/2,
                          height: 68,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {}, 
                                icon: Icon(Icons.note,color: Colors.black,),
                              ),
                  
                              Text(
                                'Transactions',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}