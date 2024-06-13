// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_mart/User/User%20Details.dart';
import 'package:gold_mart/User/User%20Home%20Button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;

  Future<void> userLoginWithEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String userEmail = _emailcontroller.text.trim();
      String userPassword = _passwordcontroller.text.trim();

      var querySnapshot = await FirebaseFirestore.instance
          .collection('userRegister')
          .where('uemail', isEqualTo: userEmail)
          .limit(1)
          .get();

      setState(() {
        _isLoading = false;
      });

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        var passwordFromDB = userData['upassword'];
        if (passwordFromDB != null && passwordFromDB == userPassword) {
          var userUid = userData['userId'];
          if (userUid != null) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('userID', userUid);
          }
          SharedPreferences pref = await SharedPreferences.getInstance();
          String? uId = pref.getString('userId');
          print('Shared Preference User ID : $uId');

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Uhomebutton()));

          Fluttertoast.showToast(
            msg: 'Successfully Logged in',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          print('Incorrect password');
          Fluttertoast.showToast(
            msg: 'Incorrect password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        print('User not found');
        Fluttertoast.showToast(
          msg: 'User Not Found',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight,
                      child: Image.asset('assets/main.jpeg', fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: Center(
                        child: SizedBox(
                          width: screenWidth - 70,
                          child: TextFormField(
                            controller: _emailcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your email';
                              } else if (!EmailValidator.validate(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 400),
                      child: Center(
                        child: SizedBox(
                          width: screenWidth - 70,
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 550),
                      child: Center(
                        child: SizedBox(
                          width: screenWidth - 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow.withOpacity(.80),
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () async {
                              userLoginWithEmail();
                              _emailcontroller.clear();
                              _passwordcontroller.clear();
                            },
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Lexend',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 700.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Udetails()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
