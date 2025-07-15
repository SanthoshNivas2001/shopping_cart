import 'dart:convert';

import 'package:ecommerce_app/data/shoes_data.dart';
import 'package:ecommerce_app/model/shoes_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoeProvider extends StateNotifier<List<ShoesModel>> {
  final List<ShoesModel> _allShoes = []; // 👈 store full list

  ShoeProvider() : super([]) {
    fetchShoeDetail();
  }

  void fetchShoeDetail() {
    final List<dynamic> decoded = jsonDecode(userJson);
    final List<ShoesModel> shoes =
        decoded.map((e) => ShoesModel.fromJson(e)).toList();
    _allShoes.clear();
    _allShoes.addAll(shoes);
    state = shoes;
  }

  // 🔍 Filter shoes by name
  void filterByName(String query) {
    if (query.toLowerCase() == "all") {
      state = List.from(_allShoes);
    } else {
      final filtered = _allShoes
          .where(
              (shoe) => shoe.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = filtered;
    }
  }

  // 🔄 Reset filter
  void resetFilter() {
    state = List.from(_allShoes);
  }
}

final shoeProvider =
    StateNotifierProvider<ShoeProvider, List<ShoesModel>>((ref) {
  return ShoeProvider();
});
