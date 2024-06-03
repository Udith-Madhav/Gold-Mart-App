// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
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
                  height: screenHeight + 300,
                  child: Image.asset(
                    'assets/udetails.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Form(
                    child: Container(
                      width: screenWidth - 50,
                      height: screenHeight + 150,
                      // decoration: BoxDecoration(border: Border.all()),
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
                            'What is your name?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
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
                            'What is your age?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
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
                                          
                                        )
                                  
                                  ),
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
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFACD18),
                                ),
                                onPressed: () async {},
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
