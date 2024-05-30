import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery%20View.dart';

class AdminJwellery extends StatefulWidget {
  const AdminJwellery({super.key});

  @override
  State<AdminJwellery> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminJwellery> {
  final List<String> items = List<String>.generate(100, (i) => '$i');
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
              'Jwellery',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: screenWidth-100,
              height: screenHeight-250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      child: Text(items[index]),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jwellery ${items[index]}'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminJwelleryView()));
                          }, 
                          child:Text('View',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),) 
                        )
                      ],
                    ),
                    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
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