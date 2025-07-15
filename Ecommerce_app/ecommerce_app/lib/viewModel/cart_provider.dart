import 'dart:convert';

import 'package:ecommerce_app/data/shoes_data.dart';
import 'package:ecommerce_app/model/shoes_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProvider extends StateNotifier<List<ShoesModel>> {

  CartProvider() : super([]);

  void fetchCart(ShoesModel shoeModel){
    state = [...state , shoeModel];
  }
  
  
  void removeShoeById(String name) {
    state = state.where((shoe) => shoe.name != name).toList();
  }
}

final cartProvider =
    StateNotifierProvider<CartProvider, List<ShoesModel>>((ref) {
  return CartProvider();
});