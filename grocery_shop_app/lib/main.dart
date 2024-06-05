import 'package:flutter/material.dart';
import 'package:grocery_shop_app/cart_model.dart';
import 'package:grocery_shop_app/pages/into_page.dart';
 import 'package:provider/provider.dart';
 void main(){
  runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      )
    );
  }
}