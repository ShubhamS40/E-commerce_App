import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/global_variables.dart';
import 'package:shoppingapp/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cart=item;
  @override
  Widget build(BuildContext context) {
  
  // final cart=context.watch<CardProvider>().cart;

    return Scaffold(
      appBar: AppBar(title: Align( alignment: Alignment.center,child: Text("Cart",style: Theme.of(context).textTheme.bodyText1)),),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem=cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(onPressed:(){}, icon: Icon(Icons.delete),),
            title: Text(cartItem["title"].toString(),style: TextStyle(fontSize: 20),),
            subtitle: Text(cartItem['size'].toString(),style: TextStyle(fontSize: 15)),
          );
        },
      )
    );
  }
}

