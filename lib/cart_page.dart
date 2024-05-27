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
  
  @override
  Widget build(BuildContext context) {
final cart=Provider.of<CartPovider>(context).cart;
  

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
            trailing: IconButton(onPressed:(){
                 showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Delete Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,fontFamily: AutofillHints.birthday),),
                    content: Text("Are you sure you want to remove the product from your cart?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,fontFamily: AutofillHints.birthday)),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("No",style: TextStyle(color: Colors.black),)),
                      TextButton(onPressed: (){
                         context
                                .read<CartPovider>()
                                .removeproduct(cartItem);
                        Navigator.of(context).pop();                                
                      }, child: Text("Yes",style: TextStyle(color: Colors.blue),))
                    ],
                  );
                 });
            }, icon: Icon(Icons.delete),),
            title: Text(cartItem["title"].toString(),style: TextStyle(fontSize: 20),),
            // subtitle: Text(cartItem['size'].toString(),style: TextStyle(fontSize: 15)),
          );
        },
      )
    );
  }
}

