import 'package:flutter/material.dart';
import 'package:shoppingapp/product_detail_page.dart';
import 'homePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      fontFamily: 'Lato',

        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
        useMaterial3: true,

      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
        bodyText2: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),

      ),
      ),
      
      home: HomePage(),
    );
  }
}

