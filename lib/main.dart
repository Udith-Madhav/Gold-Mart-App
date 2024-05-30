// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gold_mart/Admin/Admin%20Home.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery%20Edit.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery%20View.dart';
import 'package:gold_mart/Admin/Admin%20Jwellery.dart';
import 'package:gold_mart/Admin/Admin%20User.dart';
import 'package:gold_mart/Admin/Admin.dart';
import 'package:gold_mart/Front%20Page.dart';
import 'package:gold_mart/Jwellery/Discount%20Page.dart';
import 'package:gold_mart/Jwellery/Jwellery%20Register.dart';
import 'package:gold_mart/Jwellery/Orders.dart';
import 'package:gold_mart/Jwellery/Stock%20Page.dart';
import 'package:gold_mart/Login%20type.dart';
import 'package:gold_mart/User/User%20Details.dart';
import 'package:gold_mart/User/User%20Home%20Button.dart';
import 'package:gold_mart/User/User%20Home.dart';
import 'package:gold_mart/User/User%20UPI.dart';
import 'package:gold_mart/User/uLogin.dart';
import 'package:gold_mart/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FrontPage(),
    );
  }
}

