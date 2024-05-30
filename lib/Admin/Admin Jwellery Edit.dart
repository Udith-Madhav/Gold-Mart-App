import 'package:flutter/material.dart';

class AdminJwelleryEdit extends StatefulWidget {
  const AdminJwelleryEdit({super.key});

  @override
  State<AdminJwelleryEdit> createState() => _AdminJwelleryEditState();
}

class _AdminJwelleryEditState extends State<AdminJwelleryEdit> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: screenWidth-150,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    
                    Container(
                      width: screenWidth-150,
                      height: screenHeight/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),

                          Row(
                            children: [
                              SizedBox(width: 10,),

                              Text(
                                'jwellwry Name :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'Owner Name :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'GST Number :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'License Number :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'Address :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'Phone Number :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              
                              Text(
                                'Email :',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),

                              SizedBox(width: 5,),

                              Text(
                                'userID'
                              )
                            ],
                          ),

                          SizedBox(height: 30,),

                          Center(
                            child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                              ),
                              onPressed: () {}, 
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              )
                            )
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}