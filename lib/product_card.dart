
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp/global_variables.dart';
import 'package:shoppingapp/product_detail_page.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String price;
  final String title;
  final  backgroundColor;


  const ProductCard({
    super.key,
     required this.image,
     required this.title,
     required this.price,
    required this.backgroundColor
     }) ;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("${widget.title}",style: Theme.of(context).textTheme.bodyText1,),
              Text("\$ ${widget.price}",style: TextStyle(
                fontSize: 20
              )),
            ],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 7),
          child: GestureDetector(
            onTap: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(title:widget.title, image:widget.image, price: widget.price,),));
            },
            child: Image(image: AssetImage(
              widget.image
            )),
          )
        )
      ],),
    );
  }
}