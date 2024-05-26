

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp/cart_page.dart';

import 'package:shoppingapp/product_list.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage=0;

  List<Widget> pages=const [ProductList(),CartPage()];


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body:IndexedStack(index: currentpage,children: pages),
         
    bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
          currentIndex: currentpage,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ''),
      
      
      
    ],),

);
  }
}
