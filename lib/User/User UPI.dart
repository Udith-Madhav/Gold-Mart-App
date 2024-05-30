import 'package:flutter/material.dart';

class UserUPI extends StatefulWidget {
  const UserUPI({super.key});

  @override
  State<UserUPI> createState() => _UserUPIState();
}

class _UserUPIState extends State<UserUPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 180,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFD9D9D9)
              ),
              width: 213,
              height: 79,
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'UPI',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 24,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}