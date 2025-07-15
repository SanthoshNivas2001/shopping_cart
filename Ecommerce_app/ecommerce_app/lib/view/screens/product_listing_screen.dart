import 'package:ecommerce_app/utils/string_utils.dart';
import 'package:ecommerce_app/viewModel/shoe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductListingScreen extends ConsumerStatefulWidget {
  const ProductListingScreen({super.key});

  @override
  ConsumerState<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends ConsumerState<ProductListingScreen> with Strings {

  late int clickedFilter;

  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clickedFilter = 0;
  }
  
  @override
  Widget build(BuildContext context) {
    final shoes = ref.watch(shoeProvider);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                      width: 170,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      )),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          clickedFilter = index;
                          ref
                              .read(shoeProvider.notifier)
                              .filterByName(brands[index]);
                        });
                      },
                      child: Chip(
                        backgroundColor: clickedFilter == index
                            ? Colors.amber
                            : const Color.fromARGB(255, 198, 191, 191),
                        label: Text(brands[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final shoe = shoes[index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: InkWell(
                      onTap: () {
                        context.push(
                          '/details',
                          extra: {
                            'name': shoe.name,
                            'image': shoe.image,
                            'price': shoe.price,
                          },
                        );
                      },
                      child: Card(
                        color: index % 2 == 0 ? Colors.blue : Colors.cyan,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shoe.name),
                              Text(shoe.price),
                              Expanded(
                                child: Image.asset(shoe.image),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
