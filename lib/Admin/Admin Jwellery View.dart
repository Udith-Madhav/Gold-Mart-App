import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery%20Edit.dart';

class AdminJwelleryView extends StatefulWidget {
  const AdminJwelleryView({super.key});

  @override
  State<AdminJwelleryView> createState() => _AdminJwelleryViewState();
}

class _AdminJwelleryViewState extends State<AdminJwelleryView> {
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
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminJwelleryEdit()));
                              }, 
                              icon: Icon(Icons.edit_calendar_outlined,color: Colors.black,size: 24,)
                            ),
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