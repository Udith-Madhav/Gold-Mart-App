import 'package:flutter/material.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({super.key});

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  final List<String> items = List<String>.generate(10, (i) => '$i');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),

            Text(
              'Users',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: screenWidth-180,
              height: screenHeight-290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User ID : ${items[index]}'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                          onPressed: () {}, 
                          child:Text('View',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),) 
                        )
                      ],
                    ),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}