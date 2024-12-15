import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/models/product.dart';
part 'cart_provider.g.dart';
@riverpod

class CardNotifier extends _$CardNotifier{
  @override
  Set<Product> build()=> const {
      // Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/products/shorts.png')
    };
  void addProduct(Product product){
    if(!state.contains(product)){
      state = {...state, product};
    }
  }
  void removeProduct(Product product){
    if(state.contains(product)){
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}
// final cartNotifierProvider = NotifierProvider<CardNotifier,Set<Product>>((){
//   return CardNotifier();
//
// });
