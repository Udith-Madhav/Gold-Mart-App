import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin.dart';
import 'package:gold_mart/Login%20type.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
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
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Image.asset('assets/main.jpeg',fit: BoxFit.fill,),
          ),

          Positioned(
            bottom: 230,
            left: screenWidth-280,
            child: Container(
              width: 180,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFFBF3F3).withOpacity(0.67),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginType()));
                },
                child: Center(
                  child: Text('Create new account',
                  style: TextStyle(color: Color(0xFF5B4F4F)),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
              }, 
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white
                ),
              )
            ),
          ),

          Positioned(
            top: 150,
            left: screenWidth-250,
            child: Text(
              'GoldMart',
              style: TextStyle(
                fontFamily: 'Inspiration',
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Color(0xFFFBF3F3),
              ),
            ),
          ),

          Positioned(
            left: screenWidth-265,
            bottom: 300,
            child: Text(
              'Login/Register',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),
          ),

          Positioned(
            left: screenWidth-250,
            bottom: 280,
            child: Text(
              'login/signup with email',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}