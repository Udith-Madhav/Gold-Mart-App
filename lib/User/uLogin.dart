// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_mart/User/User%20Details.dart';



class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset('assets/main.jpeg',fit: BoxFit.fill,),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 400),
                child: Center(
                  child: Text("Login with Google",style: TextStyle(color: Colors.white),)
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 430),
                child: Center(
                  child: SizedBox(
                    width: screenWidth-150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.withOpacity(.80),
                        foregroundColor: Colors.black
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Udetails()));
                      }, 
                      child: Text('Login',
                      style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 18,
                              fontWeight: FontWeight.w800
                            ),
                      )
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}