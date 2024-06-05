// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Future _saveStoreId(String storeid) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('storeId', storeid);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Image.asset('assets/main.jpeg',fit: BoxFit.fill,),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Center(
                      child: SizedBox(
                        width: screenWidth-70,
                        child: TextFormField(
                          controller: _emailcontroller,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'enter your email';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email or Phone Number'
                          ),
                        ),
                      )
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(top: 400),
                    child: Center(
                      child: SizedBox(
                        width: screenWidth-70,
                        child: TextFormField(
                          controller: _passwordcontroller,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'enter your email';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password'
                          ),
                        ),
                      )
                    ),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(top: 550),
                    child: Center(
                      child: SizedBox(
                        width: screenWidth-200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.withOpacity(.80),
                            foregroundColor: Colors.black
                          ),
                          onPressed: () async{

                            if(_formKey.currentState!.validate()){
                              String email = _emailcontroller.text.trim();
                              String password = _passwordcontroller.text.trim();

                              var querySnapshot = await FirebaseFirestore.instance
                              .collection('userRegister')
                              .where('email', isEqualTo: email)
                              .limit(1)
                              .get();

                              if(querySnapshot.docs.isNotEmpty){
                                var userData = querySnapshot.docs.first.data();
                                var passwordFromDB = userData['password'] as String?;
                                if(passwordFromDB != null && passwordFromDB == password){
                                  var storeId = userData['storeId'] as String?;
                                  if(storeId != null){
                                    await _saveStoreId(storeId);
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Uhomebutton()));

                                  Fluttertoast.showToast(
                                    msg: 'Succesfully loggined',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.yellow,
                                    textColor: Colors.black,
                                    fontSize: 16.0,
                                  );
                                }else{
                                    print('incorrect password');
                                    Fluttertoast.showToast(
                                      msg: 'Incorrect Password',
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                              }
                              else{
                                    print('User not Fount');
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
                            child: Text('Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white
                            ),)
                          ),

                          TextButton(
                            onPressed: () {}, 
                            child: Text('Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white
                            ),)
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}