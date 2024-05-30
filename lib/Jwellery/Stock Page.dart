import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text(
              'Stock',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: screenWidth-200,
              height: screenHeight-200,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white)
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth-200,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                  ),

                  Container(
                    width: screenWidth-200,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Order',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: screenWidth-200,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 35,),

                            Text(
                              'View/Edit',
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                              ),
                            ),

                            Text(
                              'Discount %',
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),
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