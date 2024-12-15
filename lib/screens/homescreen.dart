import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/providers/cart_provider.dart';
import 'package:riverpod_tutorial/providers/product_providers.dart';


import '../Icons/cart_icon.dart';
class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartProducts = ref.watch(cardNotifierProvider);
    // print(allProducts.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sale Products'),
        actions: const [
          CartIcon()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context,index){
            return Container(

              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 60,height:60,),
                  Text('${allProducts[index].title} : ${allProducts[index].price}\$'),
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      if(cartProducts.contains(allProducts[index])){
                        ref.read(cardNotifierProvider.notifier)
                            .removeProduct(allProducts[index]);


                      }
                      else{
                        ref.read(cardNotifierProvider.notifier)
                            .addProduct(allProducts[index]);

                      }
                    },
                    child: Text(cartProducts.contains(allProducts[index]) ? 'Remove' : 'Add To Cart'),

                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
