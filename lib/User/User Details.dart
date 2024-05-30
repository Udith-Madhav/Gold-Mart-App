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
  // String selectedImagePath = '';
  File ? _selectedImage;

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

                          SizedBox(height: 10,),

                          Text(
                            'Upload any valid ID Proof',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),

                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all()
                                ),
                                child: 
                                _selectedImage != null ? Image.file(_selectedImage!,fit: BoxFit.fill,) : Image.asset('assets/image_picker.png',fit: BoxFit.cover,)
                              ),

                              SizedBox(width: 20,),

                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                ),
                                onPressed: () async{
                                  selectImage();
                                }, 
                                icon: Icon(Icons.upload,color: Colors.black,), 
                                label: Text('Upload',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              )
                            ],
                          ),

                          SizedBox(height: 60,),

                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFACD18),
                              ),
                              onPressed: () async{
                                
                              }, 
                              child:Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ) 
                            ),
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


  Future selectImage(){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            height: 200,
            width: 150,
            child: Column(
              children: [

                SizedBox(height: 10,),

                Text('Select Image From!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),

                SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pickImageFromGallery();
                          },
                          child: Card(
                            elevation: 5,
                            child: Image.asset('assets/gallery.png',width: 50,height: 50,),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Text('Gallery')
                      ],
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Image.asset('assets/camera.png',width: 50,height: 50,),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Text('Camera')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future _pickImageFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null) return;

    final imageTemporary =File(_selectedImage!.path);

    setState(() {
      this._selectedImage = imageTemporary;
    });
  }
}
