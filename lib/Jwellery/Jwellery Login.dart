// ignore_for_file: prefer_final_fields, unused_element, sized_box_for_whitespace, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_mart/Jwellery/Jwellery%20Register.dart';
import 'package:gold_mart/Jwellery/Stock%20Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JLogin extends StatefulWidget {
  const JLogin({super.key});

  @override
  State<JLogin> createState() => _JLoginState();
}

class _JLoginState extends State<JLogin> {

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
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                 Container(
                  width: screenWidth,
                  height: screenHeight,
                  child: Image.asset('assets/ulogin.jpeg',fit: BoxFit.fill,),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: screenWidth-50,
                        height: screenHeight/2.8,
                        // decoration: BoxDecoration(
                        //   border: Border.all()
                        // ),
                              
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              
                            TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your Email'
                              ),
                              
                              controller: _emailcontroller,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Email cannot be empty';
                                }
                                else if(!EmailValidator.validate(value,true)){
                                  return 'Inavlid Email Address';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                              
                            // SizedBox(height: 5,),
                              
                            TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password'
                              ),
                              
                              controller: _passwordcontroller,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Password cannot be emplty';
                                }
                                else if(value.length < 8){
                                  return 'Password should contain alteast 8 characters';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => JRegister()));
                                  }, 
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 15,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ) 
                                ),
                  
                                TextButton(
                                  onPressed: () {}, 
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 15,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ) 
                                ),
                              ],
                            ),
                              
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFACD18)
                              ),
                              onPressed: () async{
                                if(_formKey.currentState!.validate()){
                                  String email = _emailcontroller.text.trim();
                                  String password = _passwordcontroller.text.trim();
                  
                                  var querySnapshot = await FirebaseFirestore.instance
                                  .collection('jregister')
                                  .where('email', isEqualTo: email)
                                  .limit(1)
                                  .get();
                  
                                  if(querySnapshot.docs.isNotEmpty){
                                    var userData = querySnapshot.docs.first.data();
                                    var passwordFromDB = userData['password'] as String?;
                                    if(passwordFromDB != null && passwordFromDB == password){
                                      var storeId =userData['storeId'] as String?;
                                      if(storeId != null){
                                        await _saveStoreId(storeId);
                                      }
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => StockPage()));
                  
                                      Fluttertoast.showToast(
                                        msg: 'Succesfully loggined',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.black,
                                        fontSize: 16.0,
                                      );
                                    }
                                    else{
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
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ) 
                            )
                          ],
                        ),
                      ) 
                    ),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Center(
                    child: Text(
                      'Start to save everyday.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lexend',
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top:170),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lexend',
                        color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}