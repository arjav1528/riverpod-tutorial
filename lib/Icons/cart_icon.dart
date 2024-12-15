import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/screens/cart.dart';
class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
          },
          icon: Icon(
            Icons.shopping_bag_outlined
          ),

        ),
        Positioned(
          top: 14,
          right: 10,
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent
            ),
          ),
        )
      ],
    );
  }
}
