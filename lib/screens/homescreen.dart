import 'package:flutter/material.dart';

import '../Icons/cart_icon.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sale Products'),
        actions: const [
          CartIcon()
        ],
      ),
      body: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context,index){
          return Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey.withOpacity(0.05),
          );
        },
      ),
    );
  }
}
