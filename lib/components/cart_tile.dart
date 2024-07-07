import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/sneaker.dart';

class CartTile extends StatefulWidget {
  Sneaker sneaker;
  CartTile({super.key, required this.sneaker});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemToCard(widget.sneaker);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),

      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.sneaker.imagePath, width: 50,),
        title: Text(widget.sneaker.name),
        subtitle: Text(widget.sneaker.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}