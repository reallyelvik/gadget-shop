import 'package:ecom/models/cart.dart';
import 'package:ecom/models/gadget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, required this.gadget});
  Gadget gadget;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.gadget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(widget.gadget.imagePath),
        title: Text(widget.gadget.name),
        subtitle: Text(widget.gadget.price),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
