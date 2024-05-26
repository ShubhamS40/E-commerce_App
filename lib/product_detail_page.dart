
import 'package:flutter/material.dart';
import 'package:shoppingapp/global_variables.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String price;
  final String title;

  const ProductDetail({
    super.key,
     required this.image,
     required this.title,
     required this.price,
  
     }) ;



  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
    void onTap() {
   print("add product");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric( vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Image.asset(widget.image),
              ),
              const Spacer(flex: 2),
              SizedBox(
                height: 280,
                
                child: Container(
                  
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 232, 232),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("\$ ${widget.price}")),
                      ), // You can add the actual price here
                     
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            final size =
                                (product['sizes'] as List<String>)[index];
                            print(product["sizes"]);
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                label: Text(size), // Add semicolon here
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow
                        ),
                        onPressed:onTap,
                        
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Colors.black,
                              Icon(Icons
                                  .add_shopping_cart,color: Colors.black,), // Add icon before label
                              SizedBox(width: 8), // Add some spacing
                              Text("Add To Cart",style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
