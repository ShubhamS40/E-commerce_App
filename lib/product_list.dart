
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp/global_variables.dart';
import 'package:shoppingapp/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String selectedFilter = "All";

final List<String> fliter= const ["All","Addidas","Nike","Bata"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      
      

       child: SizedBox(

        
         child: Column(
               children: [
          Row(
            children: [
             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Text(
                  "Shoes\nCollection ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
              ))
            ],
          ),
           
           SizedBox(
            height: 70,
            
             child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
              itemCount: fliter.length,
              itemBuilder: (context,index){
                final filters=fliter[index];
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: GestureDetector(
                          onTap: () {
                           setState(() {
                              selectedFilter=filters;
                           });
                          },
                          child: Chip(backgroundColor:selectedFilter == filters ? const Color.fromARGB(255, 255, 210, 64):Color.fromARGB(255, 245, 233, 233),label:Text(filters),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                           ),
                        ),
                      ),
                    
                  ],
                );
              },
             ),
           ),
            
         
                 Expanded(
                   child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product=products[index];
                      print(product['price']);
                      return Padding(
                        
                        padding: const EdgeInsets.symmetric(horizontal: 15, ),
                        child: Container(
                         padding: EdgeInsets.symmetric(vertical: 18),
                          child: ProductCard(
                            image: product['imageUrl'] as String,
                            title:product['title'] as String,
                            price:product['price'] as String,
                            product: product,
                            
                            backgroundColor:index.isEven ? 
                            Color.fromARGB(255, 204, 230, 245) : 
                            const Color.fromRGBO(245, 247, 249, 1)
                            ),
                        ), // Assuming ProductCard takes product data
                      );

                    },
                                 ),
                 ),
              
         
        
         
               ],
             ),
       ),
    ),
    );
  }
}