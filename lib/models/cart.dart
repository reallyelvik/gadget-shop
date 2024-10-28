import 'package:ecom/models/gadget.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of gadgets
  List<Gadget> gadegtShop = [
    Gadget(
      name: 'GTX 1650 Super',
      price: '35000',
      imagePath: 'lib/images/gtx1650s.png',
    ),
    Gadget(
      name: 'RTX 4090',
      price: '320000',
      imagePath: 'lib/images/rtx4090.jpg',
    ),
    Gadget(
      name: 'RX 6900 XT',
      price: '150000',
      imagePath: 'lib/images/rx6900xt.png',
    ),
  ];

  //list of items in user cart
  List<Gadget> userCart = [];

  //get list of gadgets for sale
  List<Gadget> getgadgetList() {
    return gadegtShop;
  }

  //get cart
  List<Gadget> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Gadget gadget) {
    userCart.add(gadget);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(Gadget gadget) {
    userCart.remove(gadget);
    notifyListeners();
  }
}
