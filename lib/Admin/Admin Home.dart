import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery.dart';
import 'package:gold_mart/Admin/Admin%20Order.dart';
import 'package:gold_mart/Admin/Admin%20User.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 58,
              child: Center(
                child: Text(
                  'Manage',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),
            ),

            SizedBox(height: 60,),

            Container(
              width: 300,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminUser()));
                      },
                      child: Center(
                        child: Text(
                          'User',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminJwellery()));
                      },
                      child: Center(
                        child: Text(
                          'Jwellery',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminOrder()));
                      },
                      child: Center(
                        child: Text(
                          'Orders',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Payments',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}