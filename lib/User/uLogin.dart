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

                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lexend',
                    color: Colors.white
                  ),
                ),
            
                Positioned(
                  bottom: 200,
                  left: 80,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: screenWidth-150,
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
                              
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFACD18)
                              ),
                              onPressed: () async{
                                if(_formKey.currentState!.validate()){
                                  Fluttertoast.showToast(
                                    msg: "Login Successful",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                  
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Udetails()));
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
            
                Positioned(
                  left: 170,
                  top: 205,
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
            
                
              ],
            ),
          ],
        ),
      )
    );
  }
}