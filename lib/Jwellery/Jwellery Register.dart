// ignore_for_file: prefer_final_fields, unused_local_variable, avoid_print, sized_box_for_whitespace, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_mart/Jwellery/Jwellery%20Login.dart';

class JRegister extends StatefulWidget {
  const JRegister({super.key});

  @override
  State<JRegister> createState() => _JRegisterState();
}

class _JRegisterState extends State<JRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _jwcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _gstcontroller = TextEditingController();
  TextEditingController _licensecontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  // TextEditingController _cpasswordcontroller = TextEditingController();

  Future<void> jAdding() async{
    if(_formKey.currentState!.validate()){
      try{
        
          UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailcontroller.text.trim(), 
              password: _passwordcontroller.text.trim(),
            );

            String uid = userCredential.user!.uid;

            await FirebaseFirestore.instance.collection("jregister").doc(uid).set(
              {
                'jname' : _jwcontroller.text,
                'oname' : _namecontroller.text,
                'jgst' : _gstcontroller.text,
                'jlicence' : _licensecontroller.text,
                'jaddress' : _addresscontroller.text,
                'jphone' : _numbercontroller.text,
                'email' : _emailcontroller.text,
                'password' : _passwordcontroller.text,
                'userID' : uid,
              }
            );

            Fluttertoast.showToast(
              msg: 'Jwelley Registration Successfully Completed',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              fontSize: 16.0,
            );

            Navigator.push(context, MaterialPageRoute(builder: (context) => JLogin()));
        
      } on FirebaseAuthException catch(e){
        print('Failed to register jwellery: $e');

        String errorMessage = 'An error occurred';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email is already in use';
        }

        Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.yellow,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }catch(e){
        print('Unexpected error during registration:$e');

        Fluttertoast.showToast(
          msg: 'Unexpected error during registration',
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
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Center(
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.white)
                  // ),
                  width: screenWidth-100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      SizedBox(height: 10,),
                
                      Text(
                        'Jewelry Name',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _jwcontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter the name of the jwellery";
                          }
                          else{
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'Owner Name',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _namecontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter the name of owner";
                          }
                          else{
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'GST Number',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _gstcontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter the GST number';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'License Number',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _licensecontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter the licence number';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'Address',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _addresscontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter the address';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        maxLines: 3, 
                        minLines: 1, 
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
                        controller: _numbercontroller,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter the phone number';
                          }
                          else if(value.length != 10){
                            return 'Phone number is wrong';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixText: '+91'
                        ), 
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
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
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter your email"
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),

                      SizedBox(height: 5,),

                      TextFormField(
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
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password"
                        ),
                      ),

                      SizedBox(height: 20,),

                      // TextFormField(
                      //   controller: _cpasswordcontroller,
                      //   validator: (value) {
                      //     if(value!.isEmpty){
                      //     return 'Password cannot be emplty';
                      //   }
                      //   else if(value.length < 8){
                      //     return 'Password should contain alteast 8 characters';
                      //   }
                      //   else if(value != _passwordcontroller.text){
                      //     return 'password is not match';
                      //   }
                      //   else{
                      //     return null;
                      //   }
                      //   },
                      //   style: TextStyle(fontSize: 18),
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     fillColor: Colors.white,
                      //     filled: true,
                      //     hintText: "Conform password"
                      //   ),
                      // ),

                      SizedBox(height: 40,),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            jAdding();
                          }, 
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ),
                      ),

                      SizedBox(height: 60,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
