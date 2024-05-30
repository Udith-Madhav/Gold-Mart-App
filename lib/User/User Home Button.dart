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
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            child: Image.asset('assets/uHomePage.jpeg',fit: BoxFit.fill,),
          ),

          Positioned(
            top: 150,
            left: screenWidth/10,
            child: Container(
              width: screenWidth-100,
              height: screenHeight/3,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white)
              // ),

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

                    SizedBox(height: 10,),

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
            ),
          )
        ],
      )
    );
  }
}