import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin%20Home.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: screenWidth-80,
              height: screenHeight-250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email/Admin ID:',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    controller: _emailcontroller,
                    validator: (value){
                     if(value!.isEmpty){
                          return 'Please enter email or admin id';
                        }
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 40,),

                  Text(
                    'Password:',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    controller: _passwordcontroller,
                    validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 90,),

                  Center(
                    child: Container(
                      width: 139,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color(0xFFFACD18),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () async{
                          if(_formKey.currentState!.validate()){
                            String email = _emailcontroller.text;
                            String password = _passwordcontroller.text;
                            if(email=='udith@gmail.com' || email=='12345' && password=='password'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
                            }
                            else{
                              final snackBar = SnackBar(
                                content: Text('You entered wrong email or password'),
                                action: SnackBarAction(
                                  label: 'Undo', 
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
                                  }
                                )
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'Login',
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}