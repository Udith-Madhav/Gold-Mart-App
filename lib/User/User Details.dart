// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, unused_import, unused_field, use_super_parameters, avoid_print, unnecessary_import

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_mart/User/User%20Home%20Button.dart';
import 'package:gold_mart/User/User%20Home.dart';
import 'package:gold_mart/User/uLogin.dart';
import 'package:image_picker/image_picker.dart';

enum Category { male, female, others }

class Udetails extends StatefulWidget {
  const Udetails({Key? key}) : super(key: key);

  @override
  State<Udetails> createState() => _UdetailsState();
}

class _UdetailsState extends State<Udetails> {
  Category? _categoryItem = Category.male;
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isLoading = false; // Add this line

  Future<void> userAdding() async {
    if (_formKey.currentState!.validate() && image != null) {
      setState(() {
        _isLoading = true; // Show the progress indicator
      });

      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('Photo_add')
            .child(DateTime.now().microsecondsSinceEpoch.toString());
        await ref.putFile(image!);
        final imageurl = await ref.getDownloadURL();

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);

        String uid = userCredential.user!.uid;

        await FirebaseFirestore.instance.collection('userRegister').doc(uid).set({
          'uemail': email.text,
          'uname': name.text,
          'uphone': number.text,
          'uage': age.text,
          'ugender': _categoryItem.toString().split('.').last,
          'upassword': password.text,
          'userID': uid,
        });

        Fluttertoast.showToast(
          msg: 'User Registration Successfully Completed',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.yellow,
          textColor: Colors.black,
          fontSize: 16.0,
        );

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserLogin()));
      } on FirebaseAuthException catch (e) {
        print('Failed to register user: $e');

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
      } catch (e) {
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
      } finally {
        setState(() {
          _isLoading = false; // Hide the progress indicator
        });
      }
    }
  }

  File? image;
  XFile? pick;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight + 600,
                  child: Image.asset(
                    'assets/udetails.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: screenWidth - 50,
                      height: screenHeight + 550,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lets get to know',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFACD18)),
                          ),
                          Text(
                            'you.',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFACD18)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'What is your email?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your email'),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'What is your name?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your name'),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Your phone number?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your phone number'),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'What is your age?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: age,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your age'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'What gender do you identify?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Column(
                            children: [
                              RadioListTile<Category>(
                                value: Category.male,
                                groupValue: _categoryItem,
                                onChanged: (Category? value) {
                                  setState(() {
                                    _categoryItem = value;
                                  });
                                },
                                title: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              RadioListTile<Category>(
                                value: Category.female,
                                groupValue: _categoryItem,
                                onChanged: (Category? value) {
                                  setState(() {
                                    _categoryItem = value;
                                  });
                                },
                                title: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              RadioListTile<Category>(
                                value: Category.others,
                                groupValue: _categoryItem,
                                onChanged: (Category? value) {
                                  setState(() {
                                    _categoryItem = value;
                                  });
                                },
                                title: Text(
                                  'Others',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Upload any valid ID Proof',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all()),
                                  child: image != null
                                      ? Image.file(
                                          image!,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          'assets/downloading.png',
                                        )),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                ),
                                onPressed: () async {
                                  ImagePicker picked = ImagePicker();
                                  pick = await picked.pickImage(
                                      source: ImageSource.gallery);
                                  if (pick != null) {
                                    setState(() {
                                      image = File(pick!.path);
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.upload,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  'Upload',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Enter a password?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password'),
                          ),
                          SizedBox(height: 25),
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: _isLoading // Show CircularProgressIndicator if _isLoading is true
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFACD18),
                                    ),
                                    onPressed: () async {
                                      userAdding();
                                    },
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    )),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
