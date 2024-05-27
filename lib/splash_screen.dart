import 'package:flutter/material.dart';
import 'package:shoppingapp/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateHome();
  }
  navigateHome()async{
   await Future.delayed(Duration(milliseconds: 2000),(){});
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("Hello Shubham"),
           Icon(Icons.shopping_cart_sharp,size: 100,)
         ],

        ),
      ),
    );
  }
}