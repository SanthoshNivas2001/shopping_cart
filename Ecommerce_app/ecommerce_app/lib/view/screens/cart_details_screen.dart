import 'package:ecommerce_app/model/shoes_model.dart';
import 'package:ecommerce_app/utils/String_utils.dart';
import 'package:ecommerce_app/viewModel/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartDetailsScreen extends ConsumerStatefulWidget {
  final String name;
  final String image;
  final String price;
  const CartDetailsScreen({super.key, required this.name, required this.image , required this.price});

  @override
  ConsumerState<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends ConsumerState<CartDetailsScreen> with Strings {

  late int clickedFilter;

  late String shoeSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clickedFilter = 0;
  }

  void storingShoppingCart(ShoesModel shoeModel){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_left_outlined)),
        centerTitle: true,
        title: Text("Details"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.name.toUpperCase(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Image.asset(widget.image),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: size.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            clickedFilter = index;
                            shoeSize = size[clickedFilter];
                          });
                        },
                        child: Chip(
                          backgroundColor: clickedFilter == index
                              ? Colors.lightBlue
                              : const Color.fromARGB(255, 198, 191, 191),
                          label: Text(size[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.yellow, 
                      foregroundColor: Colors.black, 
                    ),
                    onPressed: () {
                      ref.read(cartProvider.notifier).fetchCart(ShoesModel(name: widget.name, price: widget.price, image: widget.image),);
                    },
                    child: Text("Add to cart"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
