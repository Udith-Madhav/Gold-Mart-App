// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gold_mart/User/User%20Home.dart';

class Uhomebutton extends StatefulWidget {
  const Uhomebutton({super.key});

  @override
  State<Uhomebutton> createState() => _UhomebuttonState();
}

class _UhomebuttonState extends State<Uhomebutton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset('assets/uHomePage.jpeg',fit: BoxFit.fill,),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Congrats',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                        
                      
                        
                      Text(
                        'You are all set to start your savings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                        
                      Row(
                        children: [
                          SizedBox(width: 40,),
                        
                          Text(
                            'journey.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                        
                      SizedBox(height: 55,),
                        
                      Container(
                        width: 308,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFACD18),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Userhome()));
                          },
                          child: Center(
                            child: Text(
                              'Go to Home',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}