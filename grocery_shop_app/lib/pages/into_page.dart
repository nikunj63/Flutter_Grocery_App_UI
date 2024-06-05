import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/pages/homepage.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding:const EdgeInsets.only(
              left: 80.0,right: 80,bottom:40,top:120),
            child: Image.asset('assets/images/avocado.png'), 
          ),

          // we deliver groceries at your doorstep
           Padding( 
             padding: const  EdgeInsets.all(24.0),
             child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center, 
              style: GoogleFonts.notoSerif(
                fontSize:36 ,fontWeight:FontWeight.bold),
              
              
             ),
           ),

          // fresh items everyday 
          Text(
            "Fresh items everday",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color:Colors.grey[700],
            ),
           ),

           const SizedBox(height:24), 

           const Spacer(),

          // get started button 
          GestureDetector(
            onTap:()=> Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:(context){
                  return HomePage();
                }
              )
            ),
            child: Container(
            padding:const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(16),
              color:const Color.fromARGB(255, 112, 91, 222),
            ),
            child: const Text(
              "Get Started",
              style:TextStyle(
                color:Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize:16,
                ),
            ),  
          ),
          ),
          const Spacer(), 
        ],
      ),
    );
  }
}