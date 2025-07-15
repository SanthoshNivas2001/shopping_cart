import 'package:ecommerce_app/model/shoes_model.dart';
import 'package:ecommerce_app/utils/string_utils.dart';
import 'package:ecommerce_app/view/screens/product_listing_screen.dart';
import 'package:ecommerce_app/view/screens/shopping_cart_screen.dart';
import 'package:ecommerce_app/viewModel/shoe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> with Strings {
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: currentPage == 0 ? ProductListingScreen() : ShoppingCartScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ]),
    );
  }
}
