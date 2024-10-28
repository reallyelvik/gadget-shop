import 'package:ecom/components/gadget_tile.dart';
import 'package:ecom/models/cart.dart';
import 'package:ecom/models/gadget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add gadget to cart
  void addGadgetToCart(Gadget gadget) {
    Provider.of<Cart>(context, listen: false).addItemToCart(gadget);

    //alert box
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to cart!"),
        content: Text('Check your Cart.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          //hot picks
          const Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //list of gadgets for sale
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //create a gadget
                Gadget gadget = value.getgadgetList()[index];

                //return the gadget
                return GadgetTile(
                  gadget: gadget,
                  onTap: () => addGadgetToCart(gadget),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Divider(
              color: Colors.grey[100],
            ),
          )
        ],
      ),
    );
  }
}
