import 'package:flutter/material.dart';
import 'package:gold_mart/Jwellery/Jwellery%20Login.dart';
import 'package:gold_mart/User/uLogin.dart';

class LoginType extends StatefulWidget {
  const LoginType({super.key});

  @override
  State<LoginType> createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginType> {
  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;
    double screeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screeWidth,
        height: screeHeight,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Select Login Type:',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),

            SizedBox(height: 30,),

            Container(
              width: 245,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFFACD18),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>JLogin()));
                },
                child: Center(
                  child: Text(
                    'Jwellery',
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

            SizedBox(height: 30,),

            Container(
              width: 245,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFFFFFFF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin()));
                },
                child: Center(
                  child: Text(
                    'User',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}