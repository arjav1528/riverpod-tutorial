import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/providers/product_providers.dart';
class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(reducedProducts);
    print(cartProducts.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product){
                return Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image,width: 50,height: 50,),
                      SizedBox(width: 10,),
                      Text(product.title),
                      Spacer(),
                      Text('${product.price.toString()}\$')
                    ],
                  ),

                );

              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
